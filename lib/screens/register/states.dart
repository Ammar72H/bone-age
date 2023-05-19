abstract class RegisterStates {} // Parent State

class RegisterInitialState extends RegisterStates {}



class RegisterLoadingState extends RegisterStates {}
class RegisterSuccessState extends RegisterStates {}
class RegisterFailState extends RegisterStates {}

class RegisterChooseUserState extends RegisterStates {}
class PickImageSuccessState extends RegisterStates {}
class RegisterPasswordsNotMatchedState extends RegisterStates {}
class RegisterImageNotPickedState extends RegisterStates {}
