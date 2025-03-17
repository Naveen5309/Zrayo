import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/auth_repo_implementation.dart';
import '../states/create_profile_states.dart';

class CreateProfileNotifiers extends StateNotifier<CreateProfileStates> {
  final AuthRepository authRepo;

  CreateProfileNotifiers({required this.authRepo})
      : super(CreateProfileInitial());
}
