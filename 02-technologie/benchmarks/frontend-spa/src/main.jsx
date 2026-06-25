import React from "react";
import { createRoot } from "react-dom/client";
import App from "./App.jsx";

// Montage côté client uniquement : rien n'est visible avant l'exécution de ce JS.
createRoot(document.getElementById("root")).render(<App />);
