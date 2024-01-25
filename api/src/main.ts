import express from 'express';
import bodyParser from 'body-parser';
import { GoogleAuth, JWTInput } from 'google-auth-library';
import credentials from '../google-wallet.json';
import config from '../config.json'
import createPassClass from './pass/create_class';
import createPassObject from './pass/create_object';

const httpClient = new GoogleAuth({
    credentials: credentials,
    scopes: 'https://www.googleapis.com/auth/wallet_object.issuer'
});

const app = express();

// ======================== middleware ========================
// ---------- parse application/json
// app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
// ---------- serve static files
app.use(express.static('public'));
// ---------- allow cross origin
app.use((_, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    next();
});

// ======================== routes ========================
const ROUTE_create_pass_class = '/create-pass-class';
app.post(ROUTE_create_pass_class, async (req, res) => {
    console.log("------ REQUEST: " + ROUTE_create_pass_class)
    await createPassClass(req, res, httpClient);
});

const ROUTE_create_pass_object = '/create-pass';
app.post(ROUTE_create_pass_object, async (req, res) => {
    console.log("------ REQUEST: " + ROUTE_create_pass_object)
    // await createPassClass(req, res, httpClient);
    await createPassObject(req, res);
});

// ======================== start server ========================
console.log("server start on the port " + config.port)
app.listen(config.port);