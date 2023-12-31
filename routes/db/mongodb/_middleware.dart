import 'package:dart_frog/dart_frog.dart';
import 'package:mongo_dart/mongo_dart.dart';

Handler middleware(Handler handler) {
  return (context) async {
    // final db = await Db.create(
    //     'mongodb+srv://dartfrog:dartfrogpassword@cluster0.gwlsug7.mongodb.net/TasklistDfrog?retryWrites=true&w=majority');
    final db = Db('mongodb://localhost:27017/names');
    print('DB Connect? : ${db.isConnected}');
    if (!db.isConnected) {
      await db.open();
    }
    final response = await handler.use(provider<Db>((_) => db)).call(context);
    await db.close();
    return response;
  };
}
