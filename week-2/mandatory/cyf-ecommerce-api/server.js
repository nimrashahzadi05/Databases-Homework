const express = require("express");
const app = express();




//Import pg library and create a new GET endpoint to load the list of hotels:
const { Pool } = require('pg');

const pool = new Pool({
    user: 'occ-c012',
    host: 'localhost',
    database: 'cyf_ecommerce',
    password: '',
    port: 5432
});
//get endpoint suppliers
app.get("/suppliers", function(req, res) {
    pool.query('SELECT * FROM suppliers', (error, result) => {
        res.json(result.rows);
    });
});
//get endpoint customers
app.get("/customers", function(req, res ){
    pool.query('SELECT * FROM customers', (error, result) => {
        res.json(result.rows);
    });
})
//get endpoint products
app.get("/products", function(req, res ){
    pool.query('SELECT * FROM products', (error, result) => {
        res.json(result.rows);
    });
})
//set port
app.listen(3000, function() {
    console.log("Server is listening on port 3000. Ready to accept requests!");
});