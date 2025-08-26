 # -------- Base arg (Node.js) --------
ARG NODE_VERSION=20-alpine

# -------- Builder stage --------
FROM node:${NODE_VERSION} AS builder
WORKDIR /app

# Copy lockfiles first for better cache
COPY package.json package-lock.json* pnpm-lock.yaml* yarn.lock* ./

# ---- Choose ONE package manager ----
# npm:
RUN npm ci
# pnpm (uncomment next two lines and comment "npm ci" if you use pnpm):
# RUN corepack enable && corepack prepare pnpm@latest --activate
# RUN pnpm install --frozen-lockfile

# Copy the rest of the source
COPY . .

# Build for production (choose ONE)
RUN npm run build
# RUN pnpm build

# -------- Runner stage --------
FROM node:${NODE_VERSION} AS runner
WORKDIR /app

ENV NODE_ENV=production
ENV NITRO_HOST=0.0.0.0
ENV NITRO_PORT=3000

# Copy only the built output from builder
COPY --from=builder /app/.output ./.output

EXPOSE 3000

# Optional healthcheck
HEALTHCHECK --interval=30s --timeout=3s \
  CMD node -e "fetch('http://127.0.0.1:3000/').then(r=>process.exit(r.ok?0:1)).catch(()=>process.exit(1))"

CMD ["node", ".output/server/index.mjs"]

