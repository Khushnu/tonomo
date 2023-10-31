class DummyUser {
  final String name;
  final String email;
  final String occupation;
  final String workspaceacces;
  final String rols;
   bool isSelected;

  DummyUser( 
      {required this.name,
      required this.email,
      required this.occupation,
      required this.workspaceacces,
      required this.rols, 
      this.isSelected = false});
}

List<DummyUser> dumyUser = [
  DummyUser(
      name: 'Waqar Hassan',
      email: 'waqarhassan@crifly.com',
      occupation: '',
      workspaceacces: 'yes',
      rols: 'Administration Owner'),
  DummyUser(
      name: 'Maintainance',
      email: 'test@crifly.com',
      occupation: 'Maintainace/Repair',
      workspaceacces: 'yes',
      rols: '')
];
