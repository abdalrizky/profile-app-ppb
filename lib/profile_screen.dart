import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final String nama = "Muhammad Abdal Rizky";
  final String jabatan = "Android Developer";
  final String deskripsi =
      "Saya adalah seorang mahasiswa Program Studi Informatika Universitas Mulawarman. Saya memiliki minat di bidang pengembangan aplikasi Android, terkhususnya Android Native menggunakan Kotlin. Saya memiliki beberapa pengalaman dalam membangun aplikasi mobile dan web. Saya terus berupaya mengembangkan potensi diri dengan mempelajari teknologi baru dan berkolaborasi untuk menciptakan solusi inovatif.";
  final String email = "aabdal.rizky@gmail.com";
  final String githubUrl = "https://github.com/abdalrizky";
  final String linkedinUrl = "https://linkedin.com/in/abdalrizky";
  final String instagramUrl = "https://instagram.com/aabdalrizky";
  final String playStoreUrl = "https://play.google.com/store/apps/details?id=com.abdalrizky.japridonk";
  final String djangourseUrl = "http://206.189.81.134";
  final String fotoProfilUrl = "assets/images/profile_picture.jpg";
  final String japriDonkLogoPath = "assets/images/japridonk.webp";
  final String djangourseLogoPath = "assets/images/djangourse.png";

  final List<String> skills = const [
    "Laravel",
    "Vue.js",
    "Android (Kotlin)",
    "Flutter",
    "Firebase",
    "MySQL",
    "PostgreSQL",
    "SQLite",
    "Git & Github",
  ];

  // fungsi untuk membuka URL
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Diri',
          style: TextStyle(color: Colors.white), // Teks diubah menjadi putih
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Bagian Foto Profil
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.blue.shade100,
                backgroundImage: AssetImage(fotoProfilUrl),
              ),
              const SizedBox(height: 20),

              // Bagian Nama dan Jabatan
              Text(
                nama,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                jabatan,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),

              // Bagian Deskripsi Diri
              Text(
                deskripsi,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),

              // Divider
              const Divider(),
              const SizedBox(height: 10),

              // Bagian Skills
              Text(
                'Keahlian',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.center,
                children: skills
                    .map(
                      (skill) => Chip(
                        label: Text(skill),
                        backgroundColor: Colors.blue.shade50,
                        labelStyle: TextStyle(color: Colors.blue.shade800),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),

              // Divider
              const Divider(),
              const SizedBox(height: 10),

              // Bagian Proyek
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Proyek',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),

              _buildLinkCard(
                leadingWidget: ClipOval(
                  child: SizedBox(
                    width: 40, // Ukuran standar leading icon di ListTile
                    height: 40,
                    child: Image.asset(japriDonkLogoPath, fit: BoxFit.cover),
                  ),
                ),
                title: 'JapriDonk!',
                subtitle: 'Aplikasi yang memungkinkan pengguna untuk mengirim pesan WhatsApp tanpa harus menyimpan nomor ke kontak.',
                onTap: () => showModalBottomSheet(context: context, showDragHandle: true, builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.0),
                    child: Container(
                    height: 800,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                          Center(
                            child: Text('Fitur:\n- Pengenalan teks nomor telepon dari gambar. Bagi kamu yang males ngetik nomornya satu per satu, kamu bisa coba manfaatkan fitur ini. Tinggal jepret foto di aplikasi atau ambil dari galeri ponsel, setelah itu kamu bisa salin nomornya atau langsung masuk ke WhatsApp.\n- Seleksi teks nomor telepon dari aplikasi lain, misalnya dari aplikasi telepon bawaan dan pilih "Japri". Kamu bisa langsung masuk ke WhatsApp tanpa harus membuka JapriDonk!\n- Ukuran aplikasi ini sangat kecil; hanya sekitar 2 MB. Cocok untuk diinstal di berbagai device dengan penyimpanan minim.\n- Tersedia mode gelap.\n- Tidak ada iklan.'),
                          ),
                          SizedBox(height: 20.0,),
                          ElevatedButton(
                              onPressed: () => _launchURL(playStoreUrl),
                              child: Text('Ke Play Store'),
                          )
                        ],
                      )
                    ),
                  );
                }),
                isSpecial: true,
              ),
              _buildLinkCard(
                leadingWidget: ClipOval(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(djangourseLogoPath, fit: BoxFit.cover),
                  ),
                ),
                title: 'Djangourse',
                subtitle: 'Website Massive Open Online Course (MOOC) yang memungkinkan pengguna untuk bertransaksi kursus serta melakukan pembelajaran.',
                onTap: () => _launchURL(djangourseUrl),
                isSpecial: true,
              ),

              // Divider
              const Divider(),
              const SizedBox(height: 10),

              // Bagian Kontak
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Kontak',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              _buildLinkCard(
                leadingWidget: Icon(Icons.email, color: Colors.blue[800]),
                title: 'Email',
                subtitle: email,
                onTap: () => _launchURL('mailto:$email'),
              ),
              _buildLinkCard(
                leadingWidget: Icon(Icons.code, color: Colors.blue[800]),
                title: 'GitHub',
                subtitle: githubUrl,
                onTap: () => _launchURL(githubUrl),
              ),
              _buildLinkCard(
                leadingWidget: Icon(Icons.people, color: Colors.blue[800]),
                title: 'LinkedIn',
                subtitle: linkedinUrl,
                onTap: () => _launchURL(linkedinUrl),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat card tautan
  Widget _buildLinkCard({
    required Widget leadingWidget,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isSpecial = false,
  }) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      color: isSpecial ? Colors.blue[700] : Colors.white,
      child: ListTile(
        leading: leadingWidget,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSpecial ? Colors.white : Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: isSpecial ? Colors.white70 : Colors.grey[600],
          ),
        ),
        onTap: onTap,
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: isSpecial ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
