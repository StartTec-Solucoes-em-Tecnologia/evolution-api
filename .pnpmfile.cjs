// pnpmfile.cjs - Custom pnpm configuration
// This file allows customizing package installation behavior

function readPackage(pkg, context) {
  // Customize package.json during installation
  if (pkg.name === 'baileys') {
    // Ensure baileys uses the correct version
    pkg.version = '7.0.0-rc.2';
  }

  return pkg;
}

module.exports = {
  hooks: {
    readPackage,
  },
};
