create table if not exists Customer
(
    Customer_ID       int auto_increment
        primary key,
    Customer_Name     varchar(45)          null,
    Customer_Email    varchar(45)          null,
    Customer_Password varchar(45)          null,
    Is_Farmer         tinyint(1) default 0 not null
);

create table if not exists Farmer
(
    Farmer_ID   int auto_increment
        primary key,
    Customer_ID int not null,
    constraint Farmer_Customer_ID_uindex
        unique (Customer_ID),
    constraint Farmer_Customer_Customer_ID_fk
        foreign key (Customer_ID) references Customer (Customer_ID)
            on delete cascade
);

create table if not exists Farm
(
    Farm_ID              int auto_increment
        primary key,
    Business_Name        varchar(50)     null,
    Business_Description varchar(1000)   null,
    Business_Rating      float default 0 null,
    City                 varchar(50)     not null,
    Street               varchar(500)    not null,
    Country              varchar(50)     not null,
    Province             varchar(10)     null,
    Unit                 int   default 0 null,
    Farmer_ID            int             null,
    PostalCode           varchar(6)      not null,
    constraint Farm_Farmer_Farmer_ID_fk
        foreign key (Farmer_ID) references Farmer (Farmer_ID)
            on delete cascade
);

create table if not exists Customer_Ratings
(
    Rating_ID   int auto_increment
        primary key,
    Farm_ID     int             not null,
    Customer_ID int             not null,
    Rating      float default 0 not null,
    FeedBack    varchar(200)    null,
    constraint Customer_Ratings_Customer_Customer_ID_fk
        foreign key (Customer_ID) references Customer (Customer_ID)
            on delete cascade,
    constraint Customer_Ratings_Farm_Farm_ID_fk
        foreign key (Farm_ID) references Farm (Farm_ID)
            on delete cascade
);

create table if not exists Following_Farms
(
    Following_ID int auto_increment
        primary key,
    Customer_ID  int not null,
    Farm_ID      int not null,
    constraint Following_Farms_Customer_Customer_ID_fk
        foreign key (Customer_ID) references Customer (Customer_ID)
            on delete cascade,
    constraint Following_Farms_Farm_Farm_ID_fk
        foreign key (Farm_ID) references Farm (Farm_ID)
            on delete cascade
);

create table if not exists Product
(
    Product_ID       int auto_increment
        primary key,
    Product_Name     varchar(45) not null,
    Product_Category varchar(45) not null
)
    charset = utf8;

create table if not exists Farm_Products
(
    FarmProduct_ID int auto_increment
        primary key,
    Product_ID     int           not null,
    Farm_ID        int           not null,
    Quantity       int default 0 not null,
    constraint Farm_Products_Farm_Farm_ID_fk
        foreign key (Farm_ID) references Farm (Farm_ID)
            on delete cascade,
    constraint Farmer_Products_Product_Product_ID_fk
        foreign key (Product_ID) references Product (Product_ID)
            on delete cascade
);
