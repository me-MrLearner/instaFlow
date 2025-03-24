import 'package:get/get.dart';
import 'package:instaflow/models/user_model.dart';
import 'package:instaflow/services/api_services.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var fetchedUsers = await ApiService.fetchUsers();
      users.assignAll(fetchedUsers);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch users");
    } finally {
      isLoading(false);
    }
  }
}
