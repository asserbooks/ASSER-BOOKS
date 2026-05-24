@echo off
title ASSER BOOKS — Email Setup
cd /d "%~dp0"

echo.
echo  ============================================
echo   ASSER BOOKS — Email Configuration
echo  ============================================
echo.
echo  This will open the .env file so you can add
echo  your Gmail App Password for asserbooks@gmail.com
echo.
echo  Get App Password from:
echo  https://myaccount.google.com/apppasswords
echo.
pause

notepad .env

echo.
echo  After saving .env, press any key to test email setup...
pause >nul

set NODE="C:\Users\Rohith\AppData\Local\Programs\cursor\resources\app\resources\helpers\node.exe"
%NODE% -e "require('fs').readFileSync('.env','utf8').split('\n').forEach(l=>{const i=l.indexOf('=');if(i>0)process.env[l.slice(0,i).trim()]=l.slice(i+1).trim()});const m=require('./server/mailer');if(!m.isEmailConfigured()){console.log('ERROR: SMTP_PASS not set in .env');process.exit(1)}const nm=require('nodemailer');const t=nm.createTransport({host:process.env.SMTP_HOST,port:587,auth:{user:process.env.SMTP_USER,pass:process.env.SMTP_PASS}});t.verify().then(()=>console.log('SUCCESS! Email is configured correctly.')).catch(e=>console.log('FAILED:',e.message))"

echo.
pause
