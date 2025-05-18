# 🚀 React Application Deployment to AWS with CI/CD using Terraform

## 🎯 Objective

To deploy a statically React application to AWS S3, serve it through CloudFront CDN, and implement a CI/CD pipeline using AWS CodePipeline, managed via Terraform.

---

## 🛠️ Tech Stack & Tools Used

- **React** (Frontend framework)
- **AWS S3** (Static file hosting)
- **AWS CloudFront** (Content Delivery Network)
- **AWS CodePipeline** (CI/CD orchestration)
- **AWS CodeBuild** (Build and packaging)
- **GitHub** (Source code repository)
- **Terraform** (Infrastructure as Code tool)

---


## 📦 Step 1: React App Preparation

1. Create a React app:
   ```bash
   npm install -g create-react-app
   create-react-app my-app

   cd my-app
   npm run build
   ```
##   Note: With the help of above commands Im able to setup React app. And Open in the browser at http://localhost:3000.

---

## ☁️ Step 2: S3 Setup (Static Hosting)

1. Create an S3 bucket to host the React app.
2. Enable **Static Website Hosting** on the bucket.
   - Index document: `index.html`
   <!-- - Error document: `index.html` -->
3. Ensure the bucket:
   - Allows CloudFront to access content (via Origin Access Control).
4. Upload React build files to the bucket.

---

## 🌍 Step 3: CloudFront Distribution

1. Create a CloudFront distribution with:
   - **Origin**: S3 bucket (with OAC)
   - **Default Root Object**: `index.html`
   - **Viewer Protocol Policy**: Redirect HTTP to HTTPS
   - **Caching Settings**: Adjust as needed (e.g., minimum TTL, cache headers)
2. Deploy the distribution and note the **CloudFront domain name** (e.g., `d12345.cloudfront.net`)
3. Access the domain to verify the React app is live.

## Note: Here Im able to access react app with the help of cloudfront domain.
---

## 🔁 Step 4: CI/CD Pipeline (CodePipeline)

1. Set up a **CodePipeline** that includes:
   - **Source stage**: Connects to GitHub, triggers on pushes to `master`
   - **Build stage**: Uses CodeBuild to:
     - Install dependencies
     - Build the React app
     - Sync output to S3
     - Invalidate CloudFront cache
   - **Deploy stage**: Not requires. Since build step pushes to S3

2. Create a **CodeBuild project** with a `buildspec.yml` that:
   - Runs `npm install && npm run build`
   - Uses `aws s3 sync` to upload build artifacts to S3
   - Triggers `aws cloudfront create-invalidation` to refresh the cache

---

## Note: Here also Im able to access react app on cloudfront domain. after any changes made on master branch.


## 🔐 Step 5: IAM Roles & Permissions

Ensure the following IAM roles are created and configured:

- **CodePipeline role**: Can access GitHub, CodeBuild, S3
- **CodeBuild role**: Can build, access S3, invalidate CloudFront


---

## 🔁 Step 6: Test the Full Flow

1. Push a new commit to the `master` branch of the GitHub repo.
2. This should trigger the pipeline:
   - Source → Build → Upload → Invalidate
3. Visit the CloudFront URL:
   - Confirm the latest version of the React app is deployed.

---

## 🧪 Step 7: Verifications

- ✅ S3 bucket has the latest `build/` files
- ✅ CloudFront serves the correct version of the app
- ✅ CodePipeline shows all stages as successful
- ✅ CloudFront cache is invalidated automatically

---

## ✅ Summary

By using Terraform to automate infrastructure creation and AWS services like S3, CloudFront, CodePipeline, and CodeBuild, we have built a complete and scalable deployment pipeline for a React application. This setup ensures:

- Zero-downtime deployments
- Fast global content delivery
- Automatic builds and deployments on every code push
