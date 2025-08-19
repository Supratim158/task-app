import express from "express";
import authRouter from "./router/auth";

const app =express();

app.use(express.json());
app.use("/auth", authRouter);

app.get("/", (req, res)=>{
    res.send("Welcome to my api!!")
});

app.listen(8000, ()=> {
    console.log("Server running on port 8000");

})

