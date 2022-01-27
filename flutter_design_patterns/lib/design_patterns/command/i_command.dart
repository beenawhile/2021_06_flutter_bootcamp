abstract class ICommand {
  String getTitle();
  void execute();
  void undo();
}
