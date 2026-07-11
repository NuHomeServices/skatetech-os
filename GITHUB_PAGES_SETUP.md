# SkateTech OS GitHub Pages Setup

This app should be opened from one stable HTTPS address, not as a copied `file://` or `edge://external-file` document.

## Cheapest Route

Use GitHub Pages. It is free for public repositories on GitHub Free.

## One-Time Setup

1. Create a new public GitHub repository named `skatetech-os`.
2. Upload these files to the repository root:
   - `index.html`
   - `manifest.json`
   - `sw.js`
   - `logo.png`
   - `icon-192.png`
   - `icon-512.png`
   - `.nojekyll`
   - `SUPABASE_SETUP.sql`
3. In GitHub, open the repository `Settings`.
4. Go to `Pages`.
5. Under `Build and deployment`, choose `Deploy from a branch`.
6. Select the `main` branch and `/root`, then save.
7. Wait a few minutes for GitHub to publish the app.

Your app URL will usually be:

`https://YOUR-GITHUB-USERNAME.github.io/skatetech-os/`

## Phone Install

Open that URL on your phone, then use the browser menu to add it to your home screen.

## Data Safety

Once you are using the GitHub Pages URL, keep using that same URL. Your saved wheel data belongs to that URL.

Before changing code or switching phones, use the app's `Download Backbone` or `Backup Now` button.

## Supabase Cloud Sync

GitHub Pages gives the app a stable URL. Supabase gives the app cloud storage.

1. Open your Supabase project.
2. Go to `SQL Editor`.
3. Paste and run the contents of `SUPABASE_SETUP.sql`.
4. Go to `Authentication` > `URL Configuration`.
5. Add your GitHub Pages app URL as an allowed redirect URL:

   `https://YOUR-GITHUB-USERNAME.github.io/skatetech-os/`

6. Go to `Project Settings` > `API`.
7. Copy:
   - Project URL
   - `anon` `public` key
8. Open SkateTech OS from the GitHub Pages URL.
9. Open `Profiles` > `Cloud Sync`.
10. Paste the Project URL and anon public key.
11. Enter your email and tap `Send Login Link`.
12. Open the email link on the same device.
13. Tap `Sync Now`.

Do not paste a Supabase service-role key into the app. Only use the anon public key.
