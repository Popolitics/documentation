import { useEffect, useState } from "react";

// SPA RÉALISTE : les données ne sont PAS dans le bundle.
// Elles sont récupérées par un appel réseau APRÈS le téléchargement et
// l'exécution du JS → cascade : download JS → exec → fetch → render.
// C'est ce que fait une vraie SPA qui consomme une API.
export default function App() {
  const [deputes, setDeputes] = useState(null);

  useEffect(() => {
    fetch("/deputes.json")
      .then((r) => r.json())
      .then((data) => setDeputes(data.results));
  }, []);

  if (!deputes) {
    // Avant l'arrivée des données, l'utilisateur (et le crawler) ne voit rien d'utile.
    return (
      <main style={{ maxWidth: 900, margin: "0 auto", padding: 24 }}>
        <p style={{ color: "#999" }}>Chargement…</p>
      </main>
    );
  }

  return (
    <main style={{ maxWidth: 900, margin: "0 auto", padding: 24 }}>
      <h1 style={{ fontSize: 40 }}>Députés — rendu client (SPA React + fetch API)</h1>
      <p style={{ color: "#555" }}>
        {deputes.length} députés récupérés via un appel réseau, visibles après JS + fetch.
      </p>
      <table style={{ width: "100%", borderCollapse: "collapse" }}>
        <thead>
          <tr style={{ textAlign: "left", borderBottom: "2px solid #222" }}>
            <th>Nom</th>
            <th>Groupe</th>
            <th>Votes</th>
            <th>Présence</th>
          </tr>
        </thead>
        <tbody>
          {deputes.map((d) => (
            <tr key={d.id} style={{ borderBottom: "1px solid #eee" }}>
              <td style={{ padding: "6px 0" }}>{d.nom}</td>
              <td>{d.groupe}</td>
              <td>{d.votes}</td>
              <td>{d.presence}%</td>
            </tr>
          ))}
        </tbody>
      </table>
    </main>
  );
}
