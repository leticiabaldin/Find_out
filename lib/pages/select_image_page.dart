import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FileUploadScreen extends StatefulWidget {
  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  File? _selectedFile;

  Future<void> _pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedFile = File(result.files.single.path!);
        });
      }
    } catch (e) {
      print("Erro ao selecionar o arquivo: $e");
    }
  }

  Future<void> _uploadFile() async {
    if (_selectedFile == null) return;

    final storageRef = FirebaseStorage.instance
        .ref()
        .child('uploads/${DateTime.now().toIso8601String()}.png');

    try {
      await storageRef.putFile(_selectedFile!);
      final fileUrl = await storageRef.getDownloadURL();
      print("Upload bem-sucedido! URL do arquivo: $fileUrl");
    } catch (e) {
      print("Erro ao fazer upload: $e");
    }
  }

  void _confirmSelection() {
    if (_selectedFile != null) {
      _uploadFile();
      Navigator.of(context).pop(); // Retorna para a tela anterior após confirmar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload de Arquivo"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              _selectedFile != null
                  ? ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5,
                ),
                child: Image.file(_selectedFile!),
              )
                  : Text("Nenhum arquivo selecionado"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickFile,
                child: Text("Selecionar Arquivo"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _uploadFile,
                child: Text("Upload Arquivo"),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _confirmSelection,
                    child: const Text("Confirmar"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedFile = null; // Volta à seleção
                      });
                    },
                    child: const Text("Cancelar"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
