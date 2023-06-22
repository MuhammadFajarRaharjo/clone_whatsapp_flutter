import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';
import 'package:whatsapp_flutter/common/utils/loading_page.dart';
import 'package:whatsapp_flutter/common/widgets/my_icon_button.dart';
import 'package:whatsapp_flutter/feature/auth/controller/auth_controller.dart';

class ImagePickerPage extends ConsumerStatefulWidget {
  const ImagePickerPage({super.key});

  @override
  ConsumerState<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends ConsumerState<ImagePickerPage> {
  List<Widget> imageList = [];
  int currentPage = 0;
  int? lastPage;

  /// untuk handle karena gambar yang di ambil 24
  /// saat sudah 24 gambar terambil dan user scroll sampai ke bawah
  /// gambar baru akan diambil dan ditampilkan
  /// jadi load gambar baru saat gambar terakhir sudah muncul
  handleScrolllEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent <= .33) return;
    if (currentPage == lastPage) return;
    fetchAllImages();
  }

  Future<void> fetchAllImages() async {
    lastPage = currentPage;
    List<Widget> temp = [];

    ref.read(fetchAllImagesProvider(currentPage)).whenData(
      (value) {
        for (var asset in value) {
          temp.add(
            FutureBuilder(
              future:
                  asset.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return InkWell(
                    onTap: () => Navigator.pop(context, snapshot.data),
                    splashFactory: NoSplash.splashFactory,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: MemoryImage(snapshot.data as Uint8List),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }
                return Container(
                  width: 200,
                  height: 200,
                  color: context.theme.greyColor,
                );
              },
            ),
          );
        }
      },
    );
    // // Meminta permission
    // final permission = await PhotoManager.requestPermissionExtend();
    // if (!permission.isAuth) PhotoManager.openSetting();

    // // mengambil semua gambar
    // List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
    //   type: RequestType.image,
    //   onlyAll: true,
    // );

    // List<AssetEntity> photo = await albums[0].getAssetListPaged(
    //   page: currentPage,
    //   size: 24,
    // );

    setState(() {
      imageList.addAll(temp);
      currentPage++;
    });
  }

  @override
  void initState() {
    fetchAllImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: MyIconButton(
          icon: Icons.arrow_back,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'WhatsApp',
          style: TextStyle(color: context.theme.authTitleAppBarColor),
        ),
        actions: const [MyIconButton(icon: Icons.more_vert)],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          handleScrolllEvent(notification);
          return true;
        },
        child: imageList.isEmpty
            ? const LoadingPage()
            : GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                children: imageList.map((e) => e).toList(),
              ),
      ),
    );
  }
}
