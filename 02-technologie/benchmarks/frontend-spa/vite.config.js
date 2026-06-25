import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// SPA React classique : aucun rendu serveur. Le HTML livré est quasi vide
// (#root), le contenu n'apparaît qu'après téléchargement + exécution du JS.
export default defineConfig({
  plugins: [react()],
});
