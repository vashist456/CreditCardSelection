import 'package:flutter/material.dart';
class DeleteCard extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteCard({Key? key, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDelete,
      child: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.delete, color: Colors.white),
            SizedBox(width: 8.0),
            Text('Delete Card', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}





