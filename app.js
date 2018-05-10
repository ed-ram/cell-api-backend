const express = require('express');
const persons = require('./routes/persons')
const app = express();
 
app.use(express.json());
app.use('/api/v1/persons', persons);

app.use((err,req,res,next) => {
    res.json(err)
})

module.exports = app;