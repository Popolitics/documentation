export const metadata = {
  title: "POPolitics — Députés (SSR)",
  description: "Page témoin Next.js (rendu serveur) pour le benchmark frontend",
};

export default function RootLayout({ children }) {
  return (
    <html lang="fr">
      <body style={{ fontFamily: "system-ui, sans-serif", margin: 0 }}>
        {children}
      </body>
    </html>
  );
}
