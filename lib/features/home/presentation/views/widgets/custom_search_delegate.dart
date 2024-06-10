import 'package:akhder/features/home/data/models/product.dart';
import 'package:akhder/features/home/presentation/views/widgets/seeds_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSearchDelegate extends SearchDelegate<Product>{
  List<String> products=[
    'سماد (حديد مخلبي)',
    'سماد بركة فيرت - يوريا 46 %',
    'سماد سحري من زين فيرت',
    'سماد بوتاسيوم 42 % لوران',
    'سماد احماض امينيه بودر',
    'سماد زراعي عالي فوسفور ايتي فوس',
    'سماد حيوي EM-1',
    'سماد كالسيوم زراعى',
    'سماد زراعي (زنك مخلبي 13% )',
    'سماد زين كومبوست نباتي',
    'سماد سوبر فوسفات احادي ناعم',
    'سماد كالسيوم زراعي من زين فيرت',
    'سماد للزراعات المنزلية من زين فيرت، تي اي ان بي كيه',
    'سماد حديد',
    'سماد بالبورون والمولبيدنم من زين فيرت',
    'مبيد حشري انسكتاساينس',
    'مبيد حشرى دايميثويت إيبك',
    'مبيد حشرى سفلوبريد',
    'مبيد حشرى لامبادا بيور',
    'مبيد حشرى ملاسون إيبك',
    'مبيد حشرى هيروبان',
    'زينسون مكتين مبيد حشرى - 1 لتر',
    'مبيد حشري سوبر تربو',
    'مبيد حشري جارديـنـا آنــتـي فـــايـــر',
    'مبيد حشري فـيـتـور بـاور مـيـكس',
    'سيميتار سي إس - مبيد حشري',
    'بروكليت جراند',
    'مبيد حشري موسبريد',
    'مبيد حشري اميداتوب',
    'مبيد حشري اميداتوب',
    'مكنسة أوراق شجر بلاستيكية 20 سن',
    'مجرفة تربة صغيرة',
    'جاروف بمقبض طويل',
    'طقم أدوات لعمل الحديقة',
    'ادوات صغيرة يدوية محمولة',
    'أصيص بني لزراعة الصبارات الصغيرة',
    'شوكة زراعة خلع',
    'اداة زراعة للحدائق فاس مع شوكة',
    'مجرفة يدوية',
    'فأس من الحديد الصلب باليد الخشب',
    'سومافيكس رشاش مبيدات',
    'مصيدة حبوب لقاح',
    'فراز العسل',
    'بذور بردقوش من زين سيدز',
    'بذور الريحان من زين سيدز ',
    'بذور نبات الهوهوبا',
    'تقاوي ذرة شامية',
    'نخل برحى',
    'شجرة النبق المطعوم',
    'شجرة التوت العماني',
    'شجرة التوت الأحمر',
    'شجرة النبق',
    'محصول طماطم ',
    'محصول ذرة صفراء اوكراني',
    'قهوة بالأشواجندا',
    'شاي المورينجا',
    'شاي النعناع',
    'محصول بطاطس - 1 طن',
    'ثمرة الخيار',
  ];
  @override
  String? get searchFieldLabel => 'ابحث عن منتج';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(
      onPressed:(){
        query = '';
      },
      icon: const Icon(Icons.clear) ,
    )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
    onPressed:(){
      GoRouter.of(context).pop();
    },
    icon: const Icon(Icons.navigate_before) ,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isNotEmpty ? SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Expanded(child: SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
              child: SeedsItemListView(scrollDirection: Axis.vertical,bottomPadding: 10,topPadding: 10,query: query,))),
        ],
      ),
    ): const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isNotEmpty ? SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Expanded(child: SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
              child: SeedsItemListView(scrollDirection: Axis.vertical,bottomPadding: 10,topPadding: 10,query: query,))),
        ],
      ),
    ): const SizedBox();
  }

}