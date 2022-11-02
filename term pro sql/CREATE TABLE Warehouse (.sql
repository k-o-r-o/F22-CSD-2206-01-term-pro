--DROP TABLE Warehouses;
--DROP TABLE Products;
--DROP TABLE Associates;
--DROP TABLE Customers;
--DROP TABLE Orders;
--DROP TABLE Product_Orders;
--DROP TABLE Product_Warehouse;

CREATE TABLE Warehouses (
    warehouse_id        INTEGER       NOT NULL, --pk
    city                VARCHAR(25)   not null,
    address_warehouse   varchar(100)  not null,
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

create table Orders (
    order_id            INTEGER       not null, --pk
    order_date          DECIMAL(4,2)  not null,
    customer_id         INTEGER       not null, --fk
    associate_id        INTEGER       not null  --fk
);
      
      
create TABLE Customers (
    customer_id         INTEGER       not null, --pk
    first_name          VARCHAR(30)   not null,
    last_name           VARCHAR(30)   not null,
    address_customer    varchar(100)  not null, 
    phone_num           INTEGER       not null,
    order_id            INTEGER       not null  --fk
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
      
--Orders   
    --pri key 
        ALTER table     Orders
        ADD CONSTRAINT  order_id
        PRIMARY KEY     (order_id);
        --forign key
            ALTER TABLE     Orders
            ADD CONSTRAINT  customer_id
            FOREIGN KEY     (customer_id)
            REFERENCES      Orders(customer_id);
        --forign key
            ALTER TABLE     Orders
            ADD CONSTRAINT  associate_id  
            FOREIGN KEY     (associate_id)
            REFERENCES      Orders(associate_id);
          
--Customers
    --pri key
        ALTER table     Customers
        ADD CONSTRAINT  customer_id
        PRIMARY KEY     (customer_id);
        --forign key
            ALTER TABLE     Customers
            ADD CONSTRAINT  order_id
            FOREIGN KEY     (order_id) 
            REFERENCES      Orders(order_id);   
      
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
            ADD CONSTRAINT  product_id  
            FOREIGN KEY     (product_id)
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
              