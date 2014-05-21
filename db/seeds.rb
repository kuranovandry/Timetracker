# User.create!(email: "rizer91@mail.ru", password: "Lertiaq1")
Developer.create!(team_id: 1, name: "Developer1", position: "Junior", number: 1, retired: false, notes: "Notice1")
Team.create!(name: "Teams#1", logo: File.open(File.join(Rails.root,"/app/assets/images/images.jpg")), logo_file_name: "images.jpg", logo_content_type: "image/jpeg", logo_file_size: 3746, manager: "Manager")
Project.create!(date: "2014-05-14", notes: "Notes", team_id: 1)
