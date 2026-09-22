import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home:HomePage() );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                  SizedBox(
                    width: 400,
                height: 400,
                    child: Stack(children: 
                    [Positioned.fill(
                     
                    child:Image.asset('assets/images/img.png',
                    fit: BoxFit.cover,
                    alignment: Alignment(-1.0, 0.6), ),),],
                    
                    ),
                  ),
                  

                  SizedBox(height: 24), 
                
                  Text("Grow Up Your Skills \nBy Online Courses",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 30),
                  ),
                

                SizedBox(height: 24), 


                  Text("Explore 200+ Free Courses with Certificates",
                  style: TextStyle(fontWeight:FontWeight.normal,
                  fontSize: 15),),
                

                SizedBox(height: 24), 


                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF4F33FE),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10)
                      )
                    ),
                    onPressed: (){
                      
                         Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NextPage()),
                  );
                     
                    }, child: Text("Let's Start"))
                ],),
              
            ),
          ),
        ),
      );
  }
}


class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  int _selectedCategory = 1; // "Virtual Designing" selected by default
  int _selectedNavIndex = 1; // pie-chart icon selected by default

  final List<String> _categories = ['New', 'Virtual Designing', 'Virtual Reality'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              _buildTopBar(),
              const SizedBox(height: 24),
              _buildHeader(),
              const SizedBox(height: 20),
              _buildCategoryChips(),
              const SizedBox(height: 20),
              _buildFeaturedCourses(),
              const SizedBox(height: 28),
              _buildLetsJoinHeader(),
              const SizedBox(height: 16),
              _buildCourseProgressCard(
                iconAsset: '.JS',
                iconColor: const Color(0xFFC7C3F7),
                title: 'JavaScripts',
                lessons: '8 Lesson',
                hours: '12 Hours',
                progress: 0.8,
              ),
              const SizedBox(height: 16),
              _buildCourseProgressCard(
                iconAsset: '.JS',
                iconColor: const Color(0xFFC7C3F7),
                title: 'JavaScripts',
                lessons: '8 Lesson',
                hours: '12 Hours',
                progress: 0.6,
              ),
              const SizedBox(height: 90), // space for bottom nav
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.short_text, size: 22),
        ),
        const CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(
            'https://i.pravatar.cc/150?img=13',
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'What You Want To\nLearn Today?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
            ),
            _headerBadge(Icons.school_outlined, const Color(0xFFFFE7B0)),
            const SizedBox(width: 8),
            _headerBadge(Icons.lightbulb_outline, const Color(0xFFB8F0DE)),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Join our online school that will help you Learn',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _headerBadge(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16, color: Colors.black87),
    );
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = index == _selectedCategory;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategory = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFF6B93B) : Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: isSelected ? Colors.transparent : Colors.grey[300]!,
                ),
              ),
              child: Text(
                _categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.black : Colors.grey[700],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedCourses() {
    return SizedBox(
      height: 178,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _featuredCard(
            tag: 'NEW',
            tagColor: const Color(0xFFF6B93B),
            bgColor: const Color(0xFFF6E2C0),
            icon: Icons.hub_outlined,
            title: 'Web Design',
            subtitle: '20 Videos',
            author: 'John Sumit',
          ),
          const SizedBox(width: 14),
          _featuredCard(
            tag: 'POPULAR',
            tagColor: const Color(0xFF7C6FE0),
            bgColor: const Color(0xFFD9D4F7),
            icon: Icons.code,
            title: 'Web Development',
            subtitle: 'Expert Level',
            author: 'John Sumit',
          ),
        ],
      ),
    );
  }

  Widget _featuredCard({
    required String tag,
    required Color tagColor,
    required Color bgColor,
    required IconData icon,
    required String title,
    required String subtitle,
    required String author,
  }) {
    return Container(
      width: 210,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
         
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, 
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              tag,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: tagColor,
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=15',
                ),
              ),
              const SizedBox(width: 6),
              Text(
                author,
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLetsJoinHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Let's Join",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'View All',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.blue[700],
          ),
        ),
      ],
    );
  }

  Widget _buildCourseProgressCard({
    required String iconAsset,
    required Color iconColor,
    required String title,
    required String lessons,
    required String hours,
    required double progress,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: Text(
              iconAsset,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  '$lessons   $hours',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 48,
            height: 48,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 5,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation(Color(0xFFF6B93B)),
                ),
                Text(
                  '${(progress * 100).round()}%',
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    final icons = [
      Icons.home_outlined,
      Icons.pie_chart_outline,
      Icons.notifications_none,
      Icons.settings_outlined,
    ];

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF6C5DD3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final isSelected = index == _selectedNavIndex;
          return GestureDetector(
            onTap: () => setState(() => _selectedNavIndex = index),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icons[index],
                color: isSelected ? const Color(0xFF6C5DD3) : Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}