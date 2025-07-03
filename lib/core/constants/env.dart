import 'package:flutter_dotenv/flutter_dotenv.dart';

const fileUrl = '';
final baseURl = dotenv.get('SERVER_URL');
final gitHubToken = dotenv.get('GITHUB_TOKEN');
final gitHubURl = dotenv.get('GITHUB_RELASE');
