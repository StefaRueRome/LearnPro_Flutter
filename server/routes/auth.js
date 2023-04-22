//const e = require("express");
const express = require("express");
var bcrypt = require('bcryptjs')
const User = require("../model/user");
const authRouter = express.Router();

//Sign up 
authRouter.post("/api/signup", async (req,res)=>{
    try{
        const {name, email, password}=req.body;
        const existingUser = await User.findOne({email});
        if (existingUser){
            return res.status(400).json({msg: "Usuario con el mimso correo ya exite!"});
        }
        const hashedPassword = await bcrypt.hash(password,8);
        let user = new User({
            email,
            password : hashedPassword,
            name,
        });
        user = await user.save();
        res.json(user);

    }catch (e){
        res.status(500).json({error: e.message});
        //res.status(500).json({msg: e.message});

    }
});

// Sign in 

authRouter.post("/api/signin", async (req,res)=>{
    try{
        const { email, password}=req.body;
        const user = await User.findOne({email});
        if(!user){
            return res
                .status(400)
                .json({msg: "El usuario con este correo no existe!"});
        }
        const isMatch= await bcrypt.compare(password, user.password);
        if(!isMatch){
            return res.status(400).json({msg:"Contraseña incorrecta."});
        }
        const token = jwt.sign({id:user._id},"passwordKey");
        res.json({token, ...user._doc});
    }catch(e){
        res.status(500).json({error: e.message});
    }
});

module.exports = authRouter;