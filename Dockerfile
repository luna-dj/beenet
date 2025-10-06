# Use Node.js LTS version (the package.json specifies 12.17.x but that's outdated, using LTS)
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy application files
# Note: All dependencies (net, util, os) are built-in Node.js modules, no npm install needed
COPY server.js .
COPY preload.js .
COPY index.html .
COPY build ./build

# Expose the port that the game client expects (hardcoded in game)
EXPOSE 8335

# Set environment variable to ensure the server runs without Electron
ENV NODE_ENV=production

# Run the server directly with node (not electron)
CMD ["node", "server.js"]
