import 'package:breezy/core/server/server_client.dart';

class CleanerRegistrationService {
  const CleanerRegistrationService();

  Future<OnboardingStatus> getOnboardingStatus() {
    return serverClient.registration.getOnboardingStatus();
  }

  Future<UserProfile> completeStepOne({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required DateTime dateOfBirth,
    required String gender,
  }) {
    return serverClient.registration.completeStepOne(
      SignupStepOneRequest(
        roleName: 'cleaner',
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        dateOfBirth: dateOfBirth,
        gender: gender,
      ),
    );
  }

  Future<OnboardingStatus> completeStepTwo({
    required KYCDocumentType governmentIdDocumentType,
    required String governmentIdDocumentUrl,
    required String selfieDocumentUrl,
    required String addressLine1,
    String? addressLine2,
    required String city,
    String? state,
    required String postalCode,
    required String country,
    double? latitude,
    double? longitude,
    String? additionalInfo,
  }) {
    return serverClient.registration.completeStepTwo(
      SignupStepTwoRequest(
        governmentIdDocumentType: governmentIdDocumentType,
        governmentIdDocumentUrl: governmentIdDocumentUrl,
        selfieDocumentUrl: selfieDocumentUrl,
        addressLine1: addressLine1,
        addressLine2: addressLine2,
        city: city,
        state: state,
        postalCode: postalCode,
        country: country,
        latitude: latitude,
        longitude: longitude,
        additionalInfo: additionalInfo,
      ),
    );
  }
}
