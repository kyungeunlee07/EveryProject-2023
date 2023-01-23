const express = require('express');
const fs = require('fs');
const cors = require('cors');
const path = require('path');
const bodyParser = require('body-parser');
const { hostname } = require('os');


const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.json())
app.use(cors())

const port = 4000;
app.listen(port, () => {
    console.log("Sever listening on port", port)
})

// app.use('/api/board', require('./routes/boardRouter.js')); //프론트에서 요청하는 방식이 api/boardlist


// app.use('/api/comment', require('./routes/commentRouter.js'));