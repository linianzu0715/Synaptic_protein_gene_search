## Synaptic_protein_gene_search
### Project Introduction:

In order to help our users more conveniently obtain the data of synaptic proteins and genes, we have collected a data set. Based on this data set, we designed this tool to obtain the information in the data set. Our tool allows users to search for information by searching keywords.



### Project file and folder introduction:

* **.idea**: Intellij IDEA configuration files
* **db**: Database used in project
* **Server:** Softwares for server, include Nginx, redis.
* **src**: Java code
* **target**: Maven export files.
* **.gitattributes**: Git file
* **.gitignore**: Git file
* **README.md**: readme file
* **click_me.bat**: Project start up file
* **pom.xml**: project configuration file
* **x-springboot.jar**: Package file



### Online webpage：

We provide a website to use our tools online. Because our database is now confidential, our website is temporarily closed and our data set is not public. Our data set will be released and made public in October 2020, after which we will open this website.

http://synapticgenesearch.xyz



### Configuration procedure:

1. Download the codes from our git page, it is a zip files.
2. Unzip the zip file
3. Find the "db.sql" file in "db" folder. 
4. Copy the "db.sql" file and our sqlite data file (not publish now) to the D driver in your computer
5. Execute the bat file "click_me_to_start.bat" to run the software, it will start some services required by the software.
6. Open your web brower and enter "localhost" to open the GUI page of the tool.

### User manual：

In the final GUI page, there are a total of 2 pages and 9 parts. 

1. At the top of the homepage is the logo and title of our project. We invited a friend of designer to help us design this logo. The characteristic neurons and network elements in our project are added to this logo. We also registered this logo with the intellectual property agency to ensure that we do not infringe on the intellectual property rights of others.
2. Below the logo and name is a search bar. Users are allowed to enter information in this search bar.
3. It is a SQL command generation block. When the user sends a request to the back-end program, the executed SQL command will be displayed in this block. Below the SQL command generation block is a set of button to choose the column in the table to be shown. If the button is green, it means when user click the search button for query, this column will be shown in the table below. If the button is grey, it means this column will be hidden. 
4. There are four buttons. The blue button is the searching button. User can click this button to search records from the keywords they input in the searching bar. 
5. The left yellow button is to export the table as CSV file 
6. The right yellow button is to export the PPI network information as CSV file. 
7. The orange button is for jumping to the PPI page for generating PPI network visualization.
8. Table block that display the records retrived from the database.
9. Network visualization block for diaplay the generated PPI network



#### Use case 1

Users may want to search a specific gene according to its gene name or its entrez ID. In this use case, user input a gene name or entrez ID in the search bar for query to get all available information about that specific gene name or entrez ID. The information include all papers where the gene was found, the brain region the gene was associated, the disease the gene was linked to and so on.

**Example:**

"HumanEntrez:4905" is inputted in the search bar,  "HumanEntrez", "4905" are set as the key and the value. User proposes to search records with key for "HumanEntrez" is 4905. After clicking the search button, the SQL command has been generated and all information about the gene which value in the "HumanEntrez" field are 4905 are returned. 



#### Use case 2

Users may want to search for multiple genes from their gene name or entrez ID in one time. In this use case, user input multiple gene names or entrez IDs in the search bar for query to get all available information about those gene names or entrez IDs. The information include all papers where the gene was found, the brain region the gene was associated, the disease the gene was linked to and so on.

**Example:**

Some entrezs (4905, 8927, 5413) are inputted in the search bar for query. "HumanEntrez" is the key and 4905, 8927, and 5413 are values. We want to search for information about genes that their key for "HumanEntrez" is 4905 or 8927 or 5413. After clicking the search button, the SQL command has been generated and information about genes which value in the "HumanEntrez" field is 4905 or 8927 or 5413 are returned.

#### Use case 3

Users may just want to search for part of information they need and for other part of unnecessary information they may just want to hide it. In this use case, user input multiple gene names or entrez IDs in the search bar for query. User can choose columns that shown in the table. For example, user can choose to show the papers where the gene was found and hide the disease the gene was linked to. And then user can click the search button, so that selected columns for the information about the gene will be displayed. 

**Example:**

User input "HumanEntrez:4905" in the search bar. "HumanEntrez" is the key and 4905 is value. Aiming at searching for records that their key for "HumanEntrez" is 4905, then we choose the columns to be seen. After clicking the "Compartment", "PMID", "year" and "paper" button to green and leave ”Brain-region”, "Disease", "Species" and "Method" button as grey as well as the search button, the SQL command has been generated and records which value in "HumanEntrez" field is 4905 are returned. In the table, It can be seen that "Compartment", ”PMID”, "year" and "paper" field are shown and "Brain-region", "Disease", "Species" and "Method" field are hidden. 



#### Use case 4

Users may want to export the searching results that they obtain from the GUI tool. In this use case, user input gene name or entrez ID in the search bar for query. And then user can click the button to export queried information about genes as CSV file.

**Example:**

User input "HumanEntrez:8905" in the search bar with the key of  "HumanEntrez" and value of 8905, intending to search for records with the HumanEntrez as 8905. After clicking the search button, the SQL command has been generated and records which value in the "HumanEntrez" field is 8905 are returned. After that, we click the 'export table' button to export all records. 



#### Use case 5

Users may want to select specific set of genes to extract and plot the PPI network. The specific genes can be those from a specific paper, link with a specific disease and so on. In this use case, user input keywords and values in the search bar for query. And then user can click the button to generate PPI network from queried genes.

**Example:**

User input "Year:2000" in the search bar to search genes that published in 2000. After clicking the "search" button, all information about those genes published in 2000 are shown in the table. And then user click "PPI" button, browser will jump to PPI display page to show the PPI network generated from these genes.



#### Use case 6

Users may want to export the information about the PPI network to visualize the PPI network by using other software. In this use case, user input keywords and values in the search bar for query. And then user can click the button to export information about PPI network as CSV file.

**Example:**

Users input "Year:2000" in the search bar. "Year" is the key and 2000 is the value because the target searching genes are those published in 2000. Then we click the search button, the SQL command has been generated and records which value in "Year" field is 2000 are returned. clicking the "export AB" button to export information about the PPI network as a CSV file.







 
