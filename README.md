## Synaptic_protein_gene_search
### Project Introduction:

In order to help our users more conveniently obtain the data of synaptic proteins and genes, we have collected a data set. Based on this data set, we designed this tool to obtain the information in the data set. Our tool allows users to search for information by searching keywords.



### Online webpage：

We provide a website to use our tools online. Because our database is now confidential, our website is temporarily closed and our data set is not public. Our data set will be released and made public in October 2020, after which we will open this website.

http://synapticgenesearch.xyz



### Configuration procedure:

1. Download the codes from our git page, it will be a zip files.
2. Unzip the zip file
3. Find the "db.sql" file in "db" folder
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



![Home_screen_print]()

![Home_screen_print]()



#### Use case 1

Refer to the flow chart of use case 1, the first step is to open our GUI tool and then users input single keyword in the searching bar and click the "search" button. After that, the SQl command will be shown in block and records will be shown in table.

The Figure show a example for this use case. We input "HumanEntrez:4905" in the search bar, where "HumanEntrez" is the key and "4905" is the value. We want to search records that their key for "HumanEntrez" is 4905. Then we click the search button. After that, the SQl command has been generated and records which value in "HumanEntrez" field is 4905 are returned.



![Home_screen_print]()

![Home_screen_print]()



#### Use case 2

Refer to the flow chart of use case 2, the first step is to open the GUI tool and the second step is to input multiple values in the search bar to search multiple genes or proteins. Then users click the button and fourth and the fifth step is to show SQL command and searching results.

The Figure show a example for this use case. We input HumanEntrez: 4905, 8927, 5413 in the search bar. "HumanEntrez" is the key and 4905, 8927, and 5413 are values. We want to search for records that their key for "HumanEntrez" is 4905 or 8927 or 5413. Then we click the search button. After that, the SQL command has been generated and records which value in "HumanEntrez" field is 4905 or 8927 or 5413 are returned.



![Home_screen_print]()

![Home_screen_print]()



#### Use case 3

Refer to the flow chart of use case 3 shown in figure, the first step is to open the GUI tool and the second step is inputting value in the search bar. The third step is to choose the columns to be seen.  Then the fourth step is to click the button and fifth and the sixth step is to show SQL command and searching results.

The figure show a example for the use case. We input "HumanEntrez:4905" in the search bar. "HumanEntrez" is the key and 4905 is value. We want to search for records that their key for "HumanEntrez" is 4905. Then we choose the columns to be seen. We click the "Compartment", "PMID", "year" and "paper" button to green and leave "Brain-region", "Disease", "Species" and "Method" button as grey. Then we click the search button. After that, the SQL command has been generated and records which value in "HumanEntrez" field is 4905 are returned. In the table, we can see that "Compartment", "PMID", "year" and "paper" field are shown and "Brain-region", "Disease", "Species" and "Method" field are hidden. 



![Home_screen_print]()

![Home_screen_print]()



#### Use case 4

Refer to the flow chart of use case 4, the first step is to open the GUI tool and the second step is input value in the search bar. Then the third step is to click the button and fourth and the fifth step is to show SQL command and searching results. The sixth step is to export the table as CSV file.

The figure shows a example for the use case. We input "HumanEntrez:4905" in the search bar. "HumanEntrez" is the key and 4905 is value. We want to search for records that their key for "HumanEntrez" is 4905. Then we click the search button. After that, the SQL command has been generated and records which value in "HumanEntrez" field is 4905 are returned. After that, we click the "export table" button to export all records. The exported CSV file is shown in figure .



![Home_screen_print]()

![Home_screen_print]()



#### Use case 5

Refer to the flow chart of use case 5 shown in figure, the first step is to open the GUI tool and the second step is input value in the search bar. Then the third step is to click the button and fourth and the fifth step is to show SQL command and searching results. The sixth step is to generate a PPI network

Figure shows a example of the use case 6. We input "HumanEntrez:4905" in the search bar. "HumanEntrez" is the key and 4905 is value. We want to search for records that their key for "HumanEntrez" is 4905. Then we click the search button. After that, the SQL command has been generated and records which value in "HumanEntrez" field is 4905 are returned. After that, we click the "PPI" button to generate a PPI network shown in the Figure.



![Home_screen_print]()

![Home_screen_print]()



#### Use case 6

Refer to the flow chart of use case 6 shown in Figure, the first step is to open the GUI tool and the second step is input value in the search bar. Then the third step is to click the button and the fourth and fifth step is to show SQL command and searching results. The sixth step is to generate a PPI network

The Figure show a example for the use case. We input "HumanEntrez:4905" in the search bar. "HumanEntrez" is the key and 4905 is value. We want to search for records that their key for "HumanEntrez" is 4905. Then we click the search button. After that, the SQL command has been generated and records which value in "HumanEntrez" field is 4905 are returned. Then we click the "export AB" button to export information about the PPI network.



![Home_screen_print]()

![Home_screen_print]()





 
