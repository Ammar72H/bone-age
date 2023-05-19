abstract class HomeStates {} // Parent State

class HomeInitialState extends HomeStates {}
class PickImageSuccessState extends HomeStates {}
class PickProfileImageSuccessState extends HomeStates {}


class UploadAnimalImageLoadingState extends HomeStates {}
class UploadAnimalImageSuccessState extends HomeStates {}
class UploadAnimalImageFailState extends HomeStates {}
class UploadAnimalImageImageNotPickedState extends HomeStates {}



class ChangeBottomNavBarIndexState extends HomeStates {}


class GetProfileLoadingModelData extends HomeStates {}
class GetProfileSuccessModelData extends HomeStates {}
class GetProfileFailModelData extends HomeStates {}


class GetReportsLoadingModelData extends HomeStates {}
class GetReportsSuccessModelData extends HomeStates {}
class GetReportsFailModelData extends HomeStates {}
