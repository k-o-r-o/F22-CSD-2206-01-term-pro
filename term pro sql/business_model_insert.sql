--DROP TABLE Warehouses;
--DROP TABLE Products;
--DROP TABLE Associates;
--DROP TABLE Customers;
--DROP TABLE Orders;
--DROP TABLE Product_Orders;
--DROP TABLE Product_Warehouse;

CREATE OR REPLACE SEQUENCE order_id_seq --seq for pri key in orders table
    START WITH         10000
    INCREMENT BY       1
    NO MAXVALUE
    NO CACHE
    NO CYCLE;

CREATE TABLE Warehouses (
    warehouse_id        INTEGER       NOT NULL, --pk --id betweem 0-10
    city                VARCHAR(25)   not null,
    address_warehouse   varchar(255)  not null,
    postal_code         VARCHAR(6)    not null
);
      
create table Products (
    product_id          INTEGER       not null, --pk
    brand               VARCHAR(50)   not NULL,
    model               varchar(50)   not null,
    type                VARCHAR(50)   not NULL,
    charge_type         varchar(50)   not null,
    colour              varchar(25)   not null,
    power_wattage       INTEGER       not null,
    weight              DECIMAL(3,2)  not null,
    temp_settings       INTEGER       not null,
    price               DECIMAL(5,2),
    serial_num          INTEGER                 --uk
);

CREATE TABLE Associates (
    associate_id        INTEGER       not null, --pk
    first_name          VARCHAR (30)  not null,
    last_name           VARCHAR(30)   not null
);

create TABLE Customers (
    customer_id         INTEGER       not null, --pk
    GENERATED ALWAYS AS IDENTITY      (START WITH 10000 INCREMENT BY 1),
    first_name          VARCHAR(30)   not null,
    last_name           VARCHAR(30)   not null,
    address_customer    varchar(100)  not null, 
    phone_num           INTEGER       not null,
    order_id            INTEGER       not null  --fk
);

create table Orders (
    order_id            INTEGER       not null, --pk
    order_date          DECIMAL(4,2)  not null,
    customer_id         INTEGER       not null, --fk
    associate_id        INTEGER       not null  --fk
);
      
create table Product_Orders (
    product_id          INTEGER       not null, --pk fk
    order_id            INTEGER       not null, --pk fk
    quantities          INTEGER       not null
);
      
      
create table Product_Warehouse (
    product_id          INTEGER       not null, --pk fk
    warehouse_id        INTEGER       NOT NULL, --pk fk
    quantities          INTEGER       not null
);
----------------------------------------------------------------------------------------      
       
--Warehouses      
    --pri key 
        ALTER table     Warehouses 
        ADD CONSTRAINT  warehouse_id
        PRIMARY KEY     (warehouse_id);
            
--Products      
    --pri key Products
        ALTER table     Products 
        ADD CONSTRAINT  product_id
        PRIMARY KEY     (product_id);
      
--Associates      
    --pri key 
        ALTER table     Associates
        ADD CONSTRAINT  associate_id 
        PRIMARY KEY     (associate_id );

--Customers
    --pri key
        ALTER table     Customers
        ADD CONSTRAINT  customer_id
        PRIMARY KEY     (customer_id);
  
--Orders   
    --pri key 
        ALTER table     Orders
        ADD CONSTRAINT  order_id
        PRIMARY KEY     (order_id);
        --forign key
            ALTER TABLE     Orders
            ADD CONSTRAINT  customer_id
            FOREIGN KEY     (customer_id)
            REFERENCES      Customers(customer_id);
        --forign key
            ALTER TABLE     Orders
            ADD CONSTRAINT  associate_id  
            FOREIGN KEY     (associate_id)
            REFERENCES      Associates(associate_id);
          
--Product_Orders      
    --pri key
        ALTER table     Product_Orders
        ADD CONSTRAINT  product_id
        PRIMARY KEY     (product_id);
        --forign key
            ALTER TABLE     Product_Orders
            ADD CONSTRAINT  product_id  
            FOREIGN KEY     (product_id)
            REFERENCES      Products(product_id);
      
    --pri key
        ALTER table     Product_Orders
        ADD CONSTRAINT  order_id
        PRIMARY KEY     (order_id);
        --forign key
            ALTER TABLE     Product_Orders
            ADD CONSTRAINT  Orders_id 
            FOREIGN KEY     (Orders_id)
            REFERENCES      Orders(Orders_id);
      
    --pri key
        ALTER table     Product_Orders
        ADD CONSTRAINT  product_id
        PRIMARY KEY     (product_id);
      
--Product_Warehouse
      --pri key
        ALTER table     Product_Warehouse
        ADD CONSTRAINT  product_id
        PRIMARY KEY     (product_id);
        --forign key
            ALTER TABLE     Product_Warehouse
            ADD CONSTRAINT  product_id  
            FOREIGN KEY     (product_id)
            REFERENCES      Product(product_id);
      
    --pri key
        ALTER table     Product_Warehouse
        ADD CONSTRAINT  warehouse_id
        PRIMARY KEY     (warehouse_id);
        --forign key
            ALTER TABLE     Product_Warehouse
            ADD CONSTRAINT  warehouse_id  
            FOREIGN KEY     (warehouse_id)
            REFERENCES      Warehouse(warehouse_id);     

--------------------------------------------------------------------------
--insert statments to populate database in term pro sql/business_model.sql
INSERT INTO myTable (warehouse_id, address_warehouse, city, postal_code)
VALUES
  (1,"4257 Scelerisque Ave","British Columbia","82343"),
  (5,"Ap #314-1606 Nunc Avenue","Prince Edward Island","812685"),
  (8,"Ap #178-4495 Tellus Rd.","Saskatchewan","254512"),
  (6,"Ap #982-9017 Tincidunt Rd.","Newfoundland and Labrador","3183"),
  (3,"1597 Nascetur Rd.","Massachusetts","8490");