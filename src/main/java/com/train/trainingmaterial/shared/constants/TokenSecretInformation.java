package com.train.trainingmaterial.shared.constants;

import java.util.Date;

public class TokenSecretInformation {
  private TokenSecretInformation() {}

  public static final String SIGNATURE_KEY =
      "67abdb81fdf6e6a2a4061d13091fbe3d2f96d31527561027901fd52a5eaa2b64";

  public static final long EXPIRATION_TIME = new Date().getTime() + 24 * 60 * 60 * 1000;
}
