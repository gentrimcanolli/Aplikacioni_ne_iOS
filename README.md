
## Rreth Projektit

Ky projekt paraqet një aplikacion të thjeshtë, i cili është dizajnuar për studentë. Në aplikacion mundësohet kycja dhe regjistrimi i studentëve pastaj edhe kalkulimi i kredive të studentëve(student loans), si dhe mundësohet të shihen të gjitha lëndët dhe disa informata rreth tyre si profesori i lëndës, semestri dhe ects (në rastin tonë të dhënat janë marrë nga drejtimi i Inxhinierisë Eleketrike dhe Kompjuterike).

### Kërkesat e projektit
Aplikacioni duhet të: 
- Ketë më shumë se një view
- Mundësojë kalimin nga një view në tjetrën(at)
- Përmbajë navigim
- Ketë disa kontrolla dhe të mundesojë ndërveprim me to
- Ketë një table view me custom row design
- Ketë të paktën klasa (modele)
- Shfaqë mesazhet e ndryshme si alert dialog
- Ketë një databazë të brendshme.

## Teknologjitë e përdoruara
- Xcode - version 12.4
- Swift - version 14.4
- SQLite

Aplikacioni ka target familjen e pajisjeve Iphone me version të sistemit operativ iOS 14.4.

## Përmbajtja e aplikacionit
Aplikacioni përmbanë pamjet(views), ku secila nga to përmbanë kontrolluesin (controller), klasën e saj përkatëse: 
- Sign In - pamja për kycje  (SignInViewController)
- Sign Up – pamja për regjistrim (SignUpViewController)
- Home Page – pamja kryesore pas kycjes (HomePageViewController)
- Student Loan Calculator – pamja për kalkulimin e ‘student loans’ (ViewController)
- Subjects – pamja për të shikuar lëndët (TableViewController)

Databaza e brendshme menaxhohet nga klasa DbHelper. Kalimi nga njëra pamje (view) në tjetrën mundësohet përmes ‘Navigation Controller’.

Disa nga ‘alert dialogs’ që na shfaqen në aplikacionin tonë janë:
-	për mos plotësimin e të gjitha fushave 
-	për gabimin e kredencialeve në rast të kycjes
-	për mos plotësimin e kushtit të fjalëkalimit (kërkohen 8 karaktere) në rastin e regjistrimit
-	për mos plotësimin e kushtit të email (kërkohet që email të përmbajë @student) në rastin e regjistrimit

## Përdorimi i aplikacionit
Në hapje të aplikacionit paraqitet pamja e kycjes duke kërkuar të dhënat (email dhe fjalëkalimi), butonin për kycje dhe butonin për të kaluar në pamjen për regjistrimin në rast se nuk jemi të regjistruar tashmë. 
Nëse dëshirojmë të kalojmë në pamjen për regjistrim, atëherë shtypim butonin përkatës dhe na shfaqet pamja, në të cilën kërkohen të dhënat:
- Emri 
- Mbiemri
- Email
- Fjalëkalimi

Nëse të dhënat plotësohen dhe nuk ka ndonjë problem atëherë përdoruesi regjistrohet me sukses në databazë dhe mund të kycet në aplikacion. 
Me rastin e kycjes se përdoruesit, atij i shfaqet pamja për të zgjedhur një nga dy mundësitë që i ofron aplikacioni. Për kalkulmin e kredive të studentit(student loans) dhe për të shikuar lëndët.
Në rast se shtypim butonin për kalkulimin e kredive, na shfaqet pamja, në të cilën kërkohen këto të dhëna: 
-	Shuma
-	Koha në muaj
-	Interesi

Pasi t’i mbushim këto fusha atëherë përmes butonit për kalkulim na shfaqen rezultatet për pagesat mujore dhe totali i kredive. Formula për kalkulimin e student loans është marrë nga ‘https://www.calculatorsoup.com/calculators/financial/loan-calculator.php’, ku edhe mund të testoni nëse rezultatet që kalkulohen janë të sakta.
Në rast se shtypim butonin për lëndët, na shfaqet një ‘table view’ që përmban të dhënat që tashmë gjenden në databazë. Të dhënat përfshijnë:
- Lëndën
- Profesorin e lëndës
- Semestrin e lëndës
- Kreditë ECTS e lëndës

Të gjitha testimet janë bërë në Iphone 12 Pro Max Simulator.
(I gjithë aplikacioni është në gjuhën angleze)
