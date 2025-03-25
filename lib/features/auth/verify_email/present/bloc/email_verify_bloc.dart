// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../domain/use_cases/send_email_otp_use_case.dart';
// import '../../domain/use_cases/verify_email_otp_use_case.dart';
// import 'email_verify_event.dart';
// import 'email_verify_state.dart';
// @LazySingleton()

// class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
//   final SendEmailOtpUseCase sendEmailOtpUseCase;
//   final VerifyEmailOtpUseCase verifyEmailOtpUseCase;

//   VerifyEmailBloc({
//     required this.sendEmailOtpUseCase,
//     required this.verifyEmailOtpUseCase,
//   }) : super(
//           const VerifyEmailState.initial(),
//         ) {
//     on<VerifyEmailEvent>(
//       (event, emit) async {
//         await event.when(
//           sendEmailOtp: () async {
//             emit(
//               const VerifyEmailState.loading(),
//             );
//             final response = await sendEmailOtpUseCase.sendEmailOtp();
//             await response.when(
//               success: (
//                 response,
//               ) async {
//                 emit(
//                   const VerifyEmailState.codeSent(),
//                 );
//               },
//               failure: (error) async {
//                 emit(
//                   VerifyEmailState.failure(
//                     apiErrorModel: error,
//                   ),
//                 );
//               },
//             );
//           },
//           verifyEmailOtp: (verifyEmailOtpReqBodyModel) async {
//             emit(
//               const VerifyEmailState.loading(),
//             );
//             final response = await verifyEmailOtpUseCase.verifyEmailOtp(
//               verifyEmailOtpReqBodyModel: verifyEmailOtpReqBodyModel,
//             );
//             await response.when(
//               success: (_) async {
//                 emit(
//                   const VerifyEmailState.success(
//                     data: null,
//                   ),
//                 );
//               },
//               failure: (error) async {
//                 emit(
//                   VerifyEmailState.failure(
//                     apiErrorModel: error,
//                   ),
//                 );
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }
