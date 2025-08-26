# MedProfile – SEO-Friendly Medical Profile Platform

MedProfile is a **Nuxt 3 application** built for SEO-first web development.  
It showcases a medical directory with **doctor profiles, clinic pages, and a responsive landing page**, following modern SEO best practices.

---

## 🚀 Features

### 🔍 SEO Best Practices (Implemented)
- **Dynamic meta tags** per page (`<title>`, `<meta description>`, Open Graph, Twitter Card).  
- **Canonical URLs** generated automatically.  
- **Schema.org JSON-LD** for structured data (`Physician`, `MedicalClinic`, `WebSite`).  
- **Server-Side Rendering (SSR)** for SEO bots and faster indexing.  
- **Mobile-first responsive design** with Tailwind CSS.  

### 📸 Media & Performance
- Images optimized via **Nuxt Image Module** (responsive sizes, WebP/AVIF formats, lazy loading).  
- Consistent layout rhythm (max-w-7xl + px container system).  
- Lightweight Dockerized production build using **Nuxt Nitro**.  

---

## 📂 Data Source
For this **exam project**, no database was used.  
- Doctor and institution data are stored in **JSON mockups** (`/public/data/doctors.json`, `/public/data/institutions.json`).  
- This approach demonstrates dynamic data handling in Nuxt without needing a backend.  
- Future versions can replace these with an API or CMS integration.

---

## 🛠️ Running the Project

### With Docker (recommended)
```bash
git clone https://github.com/yourname/medprofile.git
cd medprofile
docker compose up --build
