User.destroy_all

u1 = User.create :name => "Chris Will", :email => "chriswillphoto@gmail.com", :username => "chriswillphoto", :password => "chicken", :admin => true
u2 = User.create :name => "Tony Stark", :email => "ironman@gmail.com", :username => "fexy", :password => "chicken"
u3 = User.create :name => "Ernest Hemingway", :email => "oldman@gmail.com", :username => "andthesea", :password => "chicken"

Toaster.destroy_all

t1 = Toaster.create :model => "4 Slice Euro Toaster", :manufacturer => "K-Mart", :year => "2017", :ratings => 0
t2 = Toaster.create :model => "Perfect Fit Wide Slot 4 Slice Toaster", :manufacturer => "Kambrook"
t3 = Toaster.create :model => "Classic 4 Slice Toaster", :manufacturer => "Dualit"

Collection.destroy_all

c1 = Collection.create :name => "Faves"

Comment.destroy_all

r1 = Comment.create :title => "Brilliant", :body => "A lovely experience from a wonderful toaster", :rating => 5
r2 = Comment.create :title => "Good.", :body => "It's a toaster. It toasts bread.", :rating => 3
r3 = Comment.create :title => "Wild", :body => "Bought one in red. Good times.", :rating => 4

t1.comments << r1
t2.comments << r2
t3.comments << r3

u1.comments << r1
u2.comments << r3
u3.comments << r2

c1.toasters << t1 << t2

u1.collections << c1
