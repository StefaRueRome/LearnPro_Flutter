const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
mongoose.set('strictQuery', true);

const PORT = process.env.PORT || 3007;
const app = express();

app.use(express.json());
app.use(authRouter);
const DB= "mongodb+srv://tefa:test1234@proyectopi.d31udu3.mongodb.net/?retryWrites=true&w=majority";

mongoose
    .connect(DB).then(()=>{
        console.log("Conexion exitosa");
    })
    .catch((e)=>{
        console.log(e);
    })
    app.listen(PORT, "0.0.0.0", ()=> {
        console.log(`Conectado al puerto ${PORT}`);
});


//HzvJkLzLtLJPipcM
/*
const connectDB = async () => {
    try {
        mongoose.set('strictQuery', false);
        await mongoose.connect(db, {
        });
        console.log('MongoDB Connected...');
    } catch (err) {
        console.error(err.message);
        // make the process fail
        //process.exit(1);
    }
    app.listen(PORT, "0.0.0.0", ()=> {
        console.log(`Conectado al puerto ${PORT}`)})}*/