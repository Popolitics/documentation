import { DEPUTES } from "../data.js";

// Server Component : le contenu est rendu côté serveur et envoyé dans le HTML.
// → Le navigateur peint la liste immédiatement, sans attendre le JS (SSR).
export default function Page() {
  return (
    <main style={{ maxWidth: 900, margin: "0 auto", padding: 24 }}>
      <h1 style={{ fontSize: 40 }}>Députés — rendu serveur (Next.js)</h1>
      <p style={{ color: "#555" }}>
        {DEPUTES.length} députés rendus côté serveur, présents dès le premier octet de HTML.
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
          {DEPUTES.map((d) => (
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
