# Deploy ASSER BOOKS to Vercel

## Before you deploy

1. **Never commit `.env`** — it contains your Gmail password.
2. Push these files to GitHub: `index.html`, `css/`, `js/`, `assets/`, `api/`, `lib/`, `server/`, `package.json`, `vercel.json`
3. Do **not** push: `.env`, `node_modules/`, `data/`, `.server-port`

---

## Step 1 — Push latest code to GitHub

```bash
cd "c:\Users\Rohith\Downloads\assere books"
git add .
git commit -m "Add Vercel deployment config"
git push origin main
```

(Use `master` instead of `main` if that is your branch name.)

---

## Step 2 — Create Vercel account

1. Go to [https://vercel.com](https://vercel.com)
2. Sign up with **GitHub** (recommended)

---

## Step 3 — Import your GitHub project

1. Click **Add New…** → **Project**
2. Find your **asser-books** repository → **Import**
3. Vercel will auto-detect settings. Confirm:
   - **Framework Preset:** Other
   - **Root Directory:** `./` (leave default)
   - **Build Command:** `npm install` (or leave empty)
   - **Output Directory:** leave empty / `.`

---

## Step 4 — Add environment variables (required for contact form email)

Before clicking **Deploy**, open **Environment Variables** and add:

| Name | Value |
|------|--------|
| `BUSINESS_EMAIL` | `asserbooks@gmail.com` |
| `SMTP_HOST` | `smtp.gmail.com` |
| `SMTP_PORT` | `587` |
| `SMTP_SECURE` | `false` |
| `SMTP_USER` | `asserbooks@gmail.com` |
| `SMTP_PASS` | Your Gmail App Password |
| `CAPTCHA_SECRET` | Any long random string (e.g. `my-secret-key-12345`) |

Apply to: **Production**, **Preview**, and **Development**.

---

## Step 5 — Deploy

1. Click **Deploy**
2. Wait 1–2 minutes
3. Your site will be live at: `https://your-project-name.vercel.app`

---

## Step 6 — Custom domain (optional)

1. In Vercel → your project → **Settings** → **Domains**
2. Add your domain (e.g. `asserbooks.com`)
3. Follow DNS instructions from Vercel

---

## After deployment — test

1. Open your Vercel URL
2. Go to **Contact** and submit a test form
3. Check **asserbooks@gmail.com** for the inquiry email

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Form does not send email | Add all SMTP variables in Vercel → Settings → Environment Variables, then **Redeploy** |
| 404 on pages | Ensure `index.html` is in the repo root |
| Old site showing | Hard refresh: Ctrl + F5 |
| Gmail "Invalid login" | Use a new [App Password](https://myaccount.google.com/apppasswords), not your normal Gmail password |

---

## Local vs Vercel

- **Local:** Double-click `OPEN-WEBSITE.bat` → uses `server/index.js`
- **Vercel:** Uses `api/contact.js` and `api/captcha.js` (serverless)

Both send emails the same way when environment variables are set.
