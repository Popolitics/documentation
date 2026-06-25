// Jeu de données partagé (identique côté SPA) : 200 "députés" à rendre.
// Même contenu dans les deux apps → comparaison équitable SSR vs CSR.
export const DEPUTES = Array.from({ length: 200 }, (_, i) => ({
  id: i,
  nom: `Député ${i}`,
  groupe: ["RE", "RN", "LFI", "LR", "SOC", "ECO", "DEM"][i % 7],
  votes: 100 + ((i * 37) % 900),
  presence: 50 + ((i * 13) % 50),
}));
