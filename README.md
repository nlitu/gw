# English Guessing Words – Panel Juri

Aplikasi satu file (`index.html`) dengan penyimpanan di Supabase.

## Isi proyek
| File | Fungsi |
|---|---|
| `index.html` | Aplikasi panel juri (timer otomatis berhenti sesuai waktu tiap stage) |
| `supabase-setup.sql` | Membuat tabel `gw_state` + policy (jalankan sekali di Supabase SQL Editor) |
| `.github/workflows/supabase-ping.yml` | Ping harian agar project Supabase tidak di-pause |

## 1. Setup Supabase (sekali saja)
1. Buka Supabase > **SQL Editor** > **New query**.
2. Tempel isi `supabase-setup.sql`, klik **Run**.

## 2. Push ke GitHub
Unggah seluruh isi folder ini ke repo GitHub, **termasuk folder `.github`**.

## 3. Buat Repository Secret
Repo > **Settings** > **Secrets and variables** > **Actions** > tab **Secrets** > **New repository secret**.

| Name | Secret |
|---|---|
| `SUPABASE_URL` | `https://tzaodcawtvrznkrxbetx.supabase.co` |
| `SUPABASE_ANON_KEY` | `sb_publishable_u4Xs6ynQ4wG0h1kKq3kSCA_NJH-_WiS` |

Nama harus persis sama (huruf besar, tanpa spasi). Klik **Add secret** untuk masing-masing.

## 4. Uji ping
Tab **Actions** > **Supabase Keep-Alive Ping** > **Run workflow**.
Log yang benar menampilkan `Percobaan 1: HTTP 200`.

## Jadwal
Otomatis setiap hari 03:00 UTC (10:00 WIB). Ubah di baris `cron` pada file workflow.

## Troubleshooting
| Gejala | Penyebab / solusi |
|---|---|
| `Secret ... belum dibuat` | Secret belum ada atau nama salah ketik |
| `HTTP 401` / `403` | ANON key salah, atau policy belum dibuat (jalankan SQL setup) |
| `HTTP 404` | Tabel `gw_state` belum dibuat, atau URL salah |
| `HTTP 000` | URL salah / project sedang di-pause (aktifkan dulu di dashboard Supabase) |
| Jadwal berhenti jalan | Repo publik tanpa aktivitas 60 hari: aktifkan ulang di tab Actions atau buat commit kecil |

## Catatan keamanan
Key `sb_publishable_...` memang key publik (sudah ada di `index.html`). Jangan pernah memakai `service_role` key di repo atau workflow ini.
