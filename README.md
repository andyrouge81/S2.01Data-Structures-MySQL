# S2.01_Data-Structures-MySQL


  ### An introduction to relational databases, exploring, creation and behavior of tables in SQL .



# 📚 Objectives

- Learn modeling database Structures with SQL.
- To design and implement a **relational database** througth the tables, fields and relational database.  
- To practice **database normalization** and ensure **referential integrity** through primary and foreign keys.  
- To apply **entity–relationship modeling** and translate it into SQL.  
- To demonstrate the use of **relationships** (one-to-many, many-to-one) between entities such as suppliers, glasses, and clients. 



## 📋 Description

This repository contains two database projects _Optical database_ and _Pizza store database_.
It includes all necessary SQL scripts to design, create, and populate the database, as well as example queries for testing and analysis.

The repository includes:

- **Database schemas** for both projects, defining the structure of tables, keys, and relationships.
- **Data insertion scripts** with realistic sample values to test the models.
- **Entity–Relationship diagrams (ERD)** that illustrate how the data entities are connected.


## 🧾 Exercises Proposed

### Level 1 - Exercise 1 

<details>

### Optical

Firstly, the optician’s shop wants to know the supplier of each pair of glasses. Specifically, it wants to know for each supplier:

  - The name
  - The address (street, number, floor, door, city, postal code, and country)
  - Telephone
  - Fax
  - Tax Identification Number (NIF)
  - 
The shop’s purchasing policy is based on the idea that glasses of a given brand will be bought from a single supplier (in order to obtain better prices), but it may buy glasses of different brands from the same supplier. For the glasses, it wants to know:

  - The brand
  - The prescription (graduation) of each lens
  - The type of frame (rimless, plastic, or metal)
   -The color of the frame
   -The color of each lens
   -The price
    
For clients, it wants to store:
  - The name
  - The postal address
  - The phone number
  - The email address
  - The registration date
  - When a new client arrives, the system should store the client who recommended the establishment (if someone has recommended it)
  - Finally, the system must indicate which employee sold each pair of glasses.
    
</details>

### Level 1 - Execerise2

<details>

### Pizza store

You have been hired to design a website that allows customers to place online food delivery orders.

For each client, the system stores a unique identifier, along with:
  - First name
  - Last name
  - Address
  - Postal code
  - City
  - Province
  - Phone number
  - The city and province data will be stored in separate tables.
A city belongs to one province only, while a province can contain many cities.
Each city will have a unique identifier and a name.
Each province will also have a unique identifier and a name.
A person can place many orders, but each order can only be placed by one person.
    
For each order, the system stores a unique identifier, along with:

  - Date and time
  - Whether the order is for home delivery or in-store pickup
  - The quantity of each product type selected
  - The total price
An order can contain one or multiple products.
The products can be pizzas, hamburgers, or drinks.

For each product, the system stores a unique identifier, along with:
  - Name
  - Description
  - Image
  - Price
  In the case of pizzas, there are several categories that may change their names throughout the year.
Each pizza belongs to only one category, but each category can contain many pizzas.
For each category, the system stores a unique identifier and a name.
An order is managed by a single store, and one store can manage multiple orders.

For each store, the system stores a unique identifier, along with:
  - Address
  - Postal code
  - City
  - Province
Each store can employ many employees, and each employee works in only one store.

For each employee, the system stores a unique identifier, along with:
  - First name
  - Last name
  - National ID (NIF)
  - Phone number
  - Job role (either cook or delivery rider)
  For home delivery orders, it is important to record which rider delivered the order and the date and time of the delivery.

</details>
  
---

## 🧰 Technologies Used

- MySQL 8.0+ – Relational database management system  
- MySQL Workbench – Database design and forward engineering  
- MySQL WorkBench (ERR Diagram)– Table creation and data manipulation  


---

## ⚙️ Requirements

Before running the project, make sure you have:

- MySQL Server 8.0 or later  
- MySQL Workbench (or another SQL client)  
- Basic knowledge of SQL and relational databases  

---

## 🪛 Installation & Execution 🚀

1. **Clone or download** this repository:
   ```bash
   git clone (https://github.com/andyrouge81/S2.01Data-Structures-MySQL.git)
   cd S2.01Data-Structures-MySQL

2. Use MySQL Workbench to visualize tables and relationships.

3. Open MySQL Workbench (or your preferred SQL client). 
   
4. Create and load the database:
     - In WorkBench menu > File > Open SQL script
     - Select the script file *.sql
     - Create database with the sql Script 
     - Click the ⚡️ icon and execute the script 
     - The you can see the ERR diagram
       
5. Verify the installation:

    - In the *Schemas* panel, refresh to see the newly created database.
  
6. Explore and test the data:
   
   - Use MySQL Workbench’s query editor to run SQL commands.
   - Try running joins or aggregate queries to analyze sales, products, or client information.
  
## 🤝 Contributions

To contribute:

1. Fork the repository

    ```bash
    Create a new branch: feature/your-feature-name

2. Commit your changes

    ```bash
   git commit -m "feat: solved Exercise X with lambda"
    
3. Submit a Pull Request

   ```bash
   git push origin feature/myExerciseSolution
  
## 💌 Contact

For questions or feedback, feel free to open an Issue or reach out via [GitHub Profile](https://github.com/andyrouge81)
