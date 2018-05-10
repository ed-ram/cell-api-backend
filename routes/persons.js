const { Router } = require('express');
const pool = require('../db/index');
const router = Router();



router.get('/', (request,response, next) => {
    pool.query('SELECT * FROM person', (err, res) => {
        if(err) next(err);
        response.json(res.rows);
    });
});

router.get('/:id', (request, response, next) => {
    pool.query('SELECT * FROM person WHERE id = $1',[request.params.id], (err, res) => {
        if(err) next(err);
        response.json(res.rows);
    })
});

router.post('/', (request,response,next) => {
    const { userId, username, emailAddress } = request.body;
    pool.query('INSERT INTO person VALUES (DEFAULT, $1, $2, $3)', 
    [userId, username, emailAddress],
    (err,res) => {
    if(err) return next(err);
    response.redirect('/api/v1/persons');
    })
});

router.put('/:id', (request,response,next) => {
    const { id } = request.params;
    const { userId, username, emailAddress } = request.body;
    pool.query(
        'UPDATE person SET username=($1), emailAddress=($2) WHERE id=($3);', [username, emailAddress, id],
        (err, res) => {
            if(err) return next(err);
            response.redirect('/api/v1/persons');
        }
    )
});

module.exports = router;