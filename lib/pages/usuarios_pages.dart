import 'package:chat/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    Usuario(
        uid: '1', nombre: 'María', email: 'maria@hotmail.com', online: false),
    Usuario(
        uid: '2', nombre: 'Nicolas', email: 'nico@hotmail.com', online: true),
    Usuario(
        uid: '3', nombre: 'Constanza', email: 'coni@hotmail.com', online: true)
  ];

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mi Nombre',
            style: TextStyle(color: Colors.black45),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.exit_to_app, color: Colors.black45)),
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.blue[400],
                ))
            // : Icon(
            //   Icons.check_circle,
            //   color: Colors.red[400],
            // ))
          ],
        ),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          header: WaterDropHeader(
            complete: Icon(Icons.check, color: Colors.blue[400],),
            waterDropColor: Colors.blue,
          ),
          onRefresh: _cargarUsuarios,
          child: _listViewUsuarios(),
        ));
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
        separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length);
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre!),
      leading: CircleAvatar(
        child: Text(usuario.nombre!.substring(0, 2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: usuario.online! ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

  _cargarUsuarios() async {

    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    _refreshController.refreshCompleted();

  }
}
