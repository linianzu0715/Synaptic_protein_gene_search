package com.suke.czx.common.utils;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;

import java.io.*;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

@Slf4j
public class ServerUtils {

    private static final String LOGGER_PREFIX = "[ServerUtils] ";
    private static final String staticResourcePath = "x-springboot-ui";
    private static final String confPath = "conf";
    private static final String nginxConfName = "nginx.conf";
    private static final String root = "root";
    private static final String colon = ";";
    private static final int nginxSpaceNum = 2;

    private static final String doubleSlash = "\\";
    private static final String cmdPrefix = ":\ncd ";
    private static final String serverFolder = doubleSlash + "server";
    private static final String redisSuffix = doubleSlash + serverFolder + doubleSlash + "redis\nredis-server.exe redis.windows.conf\nexit";
    private static final String nginxSuffix = doubleSlash + serverFolder + doubleSlash + "nginx\nstart nginx.exe\nexit";
    private static final String execBatCmdPrefix = "cmd.exe /C start /b ";
    private static final String redisName = "redis";
    private static final String nginxName = "nginx";
    private static final String batSuffix = ".bat";
    private static final String killPrefix = "taskkill /f /im ";
    private static final String killSuffix = "* ";
    private static final String zipSuffix = ".zip";
    private static String canonicalPath = null;
    private static String firstPath = null;

    static {
        canonicalPath = System.getProperty("user.dir");
        firstPath = canonicalPath.substring(0, 1);
    }

    public static void main(String[] args) {
        startServer();
    }

    /**
     * telnet 127.0.0.1 6379
     * taskkill /f /im redis*
     * taskkill /f /im nginx*
     */
    public static void startServer() {
        List<String> serverList = new ArrayList<>();
        serverList.add(redisName);
        serverList.add(nginxName);

        /*
        //此项目暂不开始检测
        List<String> itemList = new ArrayList<>();
        for (String server : serverList) {
            if (findProcess(server)) {
                itemList.add(server);
            }
        }
        for (String item : itemList) {
            serverList.remove(item);
        }
        if (serverList.isEmpty()) {
            log.info(LOGGER_PREFIX + "服务运行正常，不需要处理");
            return;
        }*/

        //关闭服务
        closeServer(serverList);

        //解压zip
        for (String server : serverList) {
            File file = new File(canonicalPath + serverFolder + doubleSlash + server + zipSuffix);
            String destDirPath = canonicalPath + serverFolder;
            unZip(file, destDirPath, server);
        }

        String filePath = canonicalPath + serverFolder + doubleSlash + nginxName + doubleSlash + confPath + doubleSlash + nginxConfName;
        String targetSrc = canonicalPath + doubleSlash + staticResourcePath;

        //配置nginx目录
        if (!replaceFileText(filePath, targetSrc, root, colon, nginxSpaceNum)) {
            serverList.remove(nginxName);
        }

        try {
            //启动windows服务
            genAndExecBatCmd(serverList);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //传入进程名称processName
    public static boolean findProcess(String server) {
        BufferedReader bufferedReader = null;
        try {
            Process proc = Runtime.getRuntime().exec("tasklist -fi " + '"' + "imagename eq " + server + "*" + '"');
            bufferedReader = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            String line = null;
            while ((line = bufferedReader.readLine()) != null) {
                if (line.contains(server)) {
                    return true;
                }
            }
            return false;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (Exception ex) {
                }
            }
        }
    }


    private static void genAndExecBatCmd(List<String> serverList) throws Exception {
        if (serverList.isEmpty()) {
            return;
        }
        final Runtime rt = Runtime.getRuntime();
        String courseFile = null;
        String batCmd = null;
        Process ps = null;
        FileWriter fw;
        String baseBatCmd = firstPath + cmdPrefix + canonicalPath;
        String baseCourseFile = canonicalPath + serverFolder + doubleSlash;
        for (String server : serverList) {
            if (StringUtils.isBlank(server)) {
                continue;
            }
            switch (server) {
                case redisName:
                    batCmd = baseBatCmd + redisSuffix;
                    courseFile = baseCourseFile + redisName + batSuffix;
                    break;
                case nginxName:
                    batCmd = baseBatCmd + nginxSuffix;
                    courseFile = baseCourseFile + nginxName + batSuffix;
                    break;
            }
            if (StringUtils.isBlank(courseFile) || StringUtils.isBlank(batCmd)) {
                continue;
            }

            fw = new FileWriter(courseFile);
            fw.write(batCmd);
            fw.close();
            ps = rt.exec(execBatCmdPrefix + courseFile);
            log.info(LOGGER_PREFIX + "执行启动{}.bat完成", server);
        }
        if (ps != null) {
            Thread.sleep(500L);
            ps.destroy();
        }
    }

    private static void closeServer(List<String> serverList) {
        final Runtime rt = Runtime.getRuntime();
        try {
            for (String server : serverList) {
                rt.exec(killPrefix + server + killSuffix);
                log.info(LOGGER_PREFIX + "关闭{}服务成功", server);
                Thread.sleep(500);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static boolean replaceFileText(String filePath, String targetSrc, String findStartStr, String findEndStr, int spaceNum) {

        File srcFile = new File(filePath);
        String cont = read(filePath);
        String srcCont = cont;
        Matcher m = Pattern.compile(findStartStr).matcher(cont);
        if (!m.find()) {
            return false;
        }

        cont = cont.substring(m.start(), cont.length());
        m = Pattern.compile(findEndStr).matcher(cont);
        if (!m.find()) {
            return false;
        }

        String oldStr = cont.substring(findStartStr.length() + spaceNum, m.start());
        srcCont = srcCont.replace(oldStr, targetSrc);
        write(srcCont, srcFile);
        log.info(LOGGER_PREFIX + "替换文件新内容{}成功", targetSrc);
        return true;
    }


    private static String read(String path) {
        File file = new File(path);
        StringBuilder res = new StringBuilder();
        String line = null;
        try {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            while ((line = reader.readLine()) != null) {
                res.append(line).append("\n");
            }
            reader.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res.toString();
    }

    private static void write(String cont, File dist) {
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(dist));
            writer.write(cont);
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void unZip(File srcFile, String destDirPath, String server) {
        if (!srcFile.exists()) {
            return;
        }
        String[] list = new File(destDirPath).list();
        if (list == null || list.length == 0) {
            return;
        }
        for (String item : list) {
            if (server.equals(item)) {
                log.info(LOGGER_PREFIX + "文件{}.zip已解压过", server);
                return;
            }
        }
        // 开始解压
        ZipFile zipFile = null;
        try {
            zipFile = new ZipFile(srcFile);
            Enumeration<?> entries = zipFile.entries();
            while (entries.hasMoreElements()) {
                ZipEntry entry = (ZipEntry) entries.nextElement();
                // 如果是文件夹，就创建个文件夹
                if (entry.isDirectory()) {
                    String dirPath = destDirPath + "/" + entry.getName();
                    File dir = new File(dirPath);
                    dir.mkdirs();
                } else {
                    // 如果是文件，就先创建一个文件，然后用io流把内容copy过去
                    File targetFile = new File(destDirPath + "/" + entry.getName());
                    // 保证这个文件的父文件夹必须要存在
                    if (!targetFile.getParentFile().exists()) {
                        targetFile.getParentFile().mkdirs();
                    }
                    targetFile.createNewFile();
                    // 将压缩文件内容写入到这个文件中
                    InputStream is = zipFile.getInputStream(entry);
                    FileOutputStream fos = new FileOutputStream(targetFile);
                    int len;
                    byte[] buf = new byte[1024];
                    while ((len = is.read(buf)) != -1) {
                        fos.write(buf, 0, len);
                    }
                    // 关流顺序，先打开的后关闭
                    fos.close();
                    is.close();
                }
            }
            log.info(LOGGER_PREFIX + "解压{}.zip文件成功", server);
        } catch (Exception e) {
            throw new RuntimeException("unzip error from ZipUtils", e);
        } finally {
            if (zipFile != null) {
                try {
                    zipFile.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
