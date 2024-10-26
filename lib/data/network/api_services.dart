import 'dart:io';

import 'package:dio/dio.dart' as DIO;
import 'package:flutter/material.dart';
import 'package:tentwenty_test/utils/toast.dart';


import '../network/server_error.dart';

class API {
  // CheckConnectivityServices connectivityServices = CheckConnectivityServices();
  Future getRequest(
    BuildContext context,
    String apiurl,
  ) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      var dio = DIO.Dio();
      var response = await dio
          .get(
        apiurl,
        options: DIO.Options(
            receiveTimeout: Duration(milliseconds: 30000),
            headers: {
              'accept': '*/*',
            }),
      )
          .whenComplete(() {
        debugPrint("Getting Process is Complete:");
      }).catchError((onError) {
        // if (onError is DioError) {
        //    toast( context: context, msg:"No internet connection!");
        //   }

        debugPrint("GET Error: ${onError.toString()}");
      });

      return response;
    } catch (error) {
      if (error is SocketException) {
        toast(context: context, msg: "No internet connection!");
      } else {
        if (error is DIO.DioError) {
          if (ServerError.withError(error: error).getErrorCode() == 401) {
          } else {
            toast(
                context: context,
                msg: ServerError.withError(error: error)
                    .getErrorMessage()
                    .toString());
          }
        }
      }
    }
    // } else {
    //  toast( context: context, msg:"No internet connection, try later");
    // }
  }

  Future getRequestHeader(
    BuildContext context,
    String apiurl,
    String token,
  ) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      print("apiurl $apiurl");
      var dio = DIO.Dio();
      var response = await dio
          .get(
        apiurl,
        options: DIO.Options(headers: {
          'accept': 'application/json',
          "Authorization": token,
        }),
      )
          .whenComplete(() {
        debugPrint("Getting Process is Complete:");
      }).catchError((onError) {
        debugPrint("GET Error: ${onError.toString()}");
      });
      return response;
    } catch (error) {
      if (error is SocketException) {
        toast(context: context, msg: "No internet connection!");
      } else {
        if (error is DIO.DioError) {
          print("--------Print--------");
          print(ServerError.withError(error: error).getErrorCode());

          if (ServerError.withError(error: error).getErrorCode() == 401) {
            toast(
                msg: ServerError.withError(error: error).getErrorMessage(),
                context: context);
          } else if (ServerError.withError(error: error).getErrorCode() ==
              404) {
            toast(
                msg: ServerError.withError(error: error).getErrorMessage(),
                context: context);
          } else {
            toast(
                context: context,
                msg: ServerError.withError(error: error)
                    .getErrorMessage()
                    .toString());
          }
        }
      }
    }
    // } else {
    //  toast( context: context, msg:"No internet connection, try later");
    // }
  }

  Future getRequestHeaderData(
    BuildContext context,
    String apiurl,
    data,
    String token,
  ) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      print("apiurl $apiurl");
      var dio = DIO.Dio();
      var response = await dio
          .get(
        apiurl,
        data: data,
        options: DIO.Options(
            headers: {'accept': 'application/json', "Authorization": token}),
      )
          .whenComplete(() {
        debugPrint("Getting Process is Complete:");
      }).catchError((onError) {
        debugPrint("GET Error: ${onError.toString()}");
      });

      return response;
    } catch (error) {
      if (error is SocketException) {
        toast(context: context, msg: "No internet connection!");
      } else {
        if (error is DIO.DioError) {
          print(ServerError.withError(error: error).getErrorCode());

          if (ServerError.withError(error: error).getErrorCode() == 401) {
          } else {
            toast(
                context: context,
                msg: ServerError.withError(error: error)
                    .getErrorMessage()
                    .toString());
          }
        }
      }
    }
    // } else {
    //  toast( context: context, msg:"No internet connection, try later");
    // }
  }

  Future postRequest(
    BuildContext context,
    String apiurl,
    var data, {
    bool isJsonType = false,
  }) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      var dio = DIO.Dio();
      print(apiurl);
      var response = await dio.post(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'Accept': '*/*',
          'Content-type':
              isJsonType ? 'application/json' : 'multipart/form-data',
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        if (ServerError.withError(error: onError).getErrorCode() == 500) {
          toast(context: context, msg: "SomeThing Went Wrong");
        } else if (ServerError.withError(error: onError).getErrorCode() ==
            401) {
          toast(
              context: context,
              msg: ServerError.withError(error: onError).getErrorMessage());
        } else if (ServerError.withError(error: onError).getErrorCode() ==
            404) {
          toast(
              context: context,
              msg: ServerError.withError(error: onError).getErrorMessage());
        }
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          toast(context: context, msg: "No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
              //
            } else {
              toast(
                  context: context,
                  msg: ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //  toast( context: context, msg:"No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //
      //     } else {
      //       print("error$error");
      //      toast( context: context, msg:ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //  toast( context: context, msg:"No internet connection, try later");
    // }
  }

  Future postRequestHeader(
      BuildContext context, String apiurl, var data, String token,
      {bool isJsonType = false}) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      var dio = DIO.Dio();

      var response = await dio.post(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'accept': '*/*',
          'Content-type':
              isJsonType ? 'application/json' : 'multipart/form-data',
          "Authorization": token,
        }, responseType: DIO.ResponseType.plain),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          toast(context: context, msg: "No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
            } else if (ServerError.withError(error: onError).getErrorCode() ==
                401) {
              toast(
                  context: context,
                  msg: ServerError.withError(error: onError).getErrorMessage());
            } else if (ServerError.withError(error: onError).getErrorCode() ==
                404) {
              toast(
                  context: context,
                  msg: ServerError.withError(error: onError).getErrorMessage());
            } else {
              toast(
                  context: context,
                  msg: ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //  toast( context: context, msg:"No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //
      //     } else {
      //      toast( context: context, msg:ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //  toast( context: context, msg:"No internet connection, try later");
    // }
  }

  Future postRequestHeaderWithoutBody(
    BuildContext context,
    String apiurl,
    String token,
  ) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      print(apiurl);

      var dio = DIO.Dio();

      var response = await dio.post(
        apiurl,
        options: DIO.Options(headers: {
          'Accept': '*/*',
          'Content-type': 'application/json',
          "Authorization": token,
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          toast(context: context, msg: "No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
            } else {
              toast(
                  context: context,
                  msg: ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //  toast( context: context, msg:"No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //
      //     } else {
      //      toast( context: context, msg:ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //  toast( context: context, msg:"No internet connection, try later");
    // }
  }

  Future patchRequestHeader(
      BuildContext context, String apiurl, var data) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      var dio = DIO.Dio();

      var response = await dio.patch(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'Accept': '*/*',
          'Content-type': 'application/json',
          'x-secret': 'MonrooHeaders'
          // "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          toast(context: context, msg: "No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
            } else {
              toast(
                  context: context,
                  msg: ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //  toast( context: context, msg:"No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //
      //     } else {
      //      toast( context: context, msg:ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //  toast( context: context, msg:"No internet connection, try later");
    // }
  }

  Future putRequest(BuildContext context, String apiurl, var data) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      var dio = DIO.Dio();

      var response = await dio.put(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'x-secret': 'MonrooHeaders'
          // if (firebaseToken != "")
          //   "Authorization": "Firebase ${firebaseToken.toString()}",
          // if (firebaseToken == "")
          //   "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          toast(context: context, msg: "No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
            } else {
              toast(
                  context: context,
                  msg: ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //  toast( context: context, msg:"No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //
      //     } else {
      //      toast( context: context, msg:ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //  toast( context: context, msg:"No internet connection, try later");
    // }
  }

  Future putRequestHeader(
      BuildContext context, String apiurl, var data, String authToken) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      var dio = DIO.Dio();

      var response = await dio.put(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'x-secret': 'MonrooHeaders'
          // "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:" + authToken);
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          toast(context: context, msg: "No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
            } else {
              toast(
                  context: context,
                  msg: ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //  toast( context: context, msg:"No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //
      //     } else {
      //      toast( context: context, msg:ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //  toast( context: context, msg:"No internet connection, try later");
    // }
  }

  Future profileUpdateMultiPart(
    BuildContext context,
    String apiurl,
    var data,
  ) async {
    // if (await connectivityServices.onConnectivity()) {

    DIO.FormData formData;

    String fileName = await data["image"].split('/').last;
    print("fileName $fileName");
    formData = DIO.FormData.fromMap({
      "image": await DIO.MultipartFile.fromFile(File(data["image"]).path,
          filename: fileName),
      "name": data["name"],
      "email": data["email"],
    });
    print("formData ${formData.fields}");

    // try {
    var dio = DIO.Dio();
    var response = await dio.put(
      apiurl,
      data: formData,
      options: DIO.Options(
          receiveTimeout: Duration(milliseconds: 3000000),
          headers: {
            "Accept": 'application/json',
            'Content-Type': 'multipart/form-data',
            'x-secret': 'MonrooHeaders'
            // "Authorization": "Bearer ${token.toString()}",
          }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((onError) {
      debugPrint("POST Error: $onError");
      if (onError is SocketException) {
        toast(context: context, msg: "No internet connection!");
      } else {
        if (onError is DIO.DioError) {
          if (ServerError.withError(error: onError).getErrorCode() == 401) {
          } else {
            toast(
                context: context,
                msg: ServerError.withError(error: onError)
                    .getErrorMessage()
                    .toString());
          }
        }
      }
    });
    print("jhhjjhjhjh");
    print(response);

    return response;
    // } catch (error) {
    //   print("jjijijiji");
    //   print(error);
    //   // if (error is SocketException) {
    //   //  toast( context: context, msg:"No internet connection!");
    //   // } else {
    //   //   if (error is DIO.DioError) {
    //   //     if (ServerError.withError(error: error).getErrorCode() == 401) {
    //   //
    //   //     } else {
    //   //      toast( context: context, msg:ServerError.withError(error: error)
    //   //           .getErrorMessage()
    //   //           .toString());
    //   //     }
    //   //   }
    //   // }
    // }
    // } else {
    //  toast( context: context, msg:"No internet connection, try later");
    // }
  }

  Future postMultiPart(
    BuildContext context,
    String apiurl,
    var data,
  ) async {
    print(data);
    // if (await connectivityServices.onConnectivity()) {

    DIO.FormData formData;
    if (data["image"] == null) {
      formData = DIO.FormData.fromMap(
          {"description": data["description"], "_method": "POST"});
      print("formData ${formData.fields}");
    } else {
      String fileName = await data["image"].split('/').last;
      print("fileName $fileName");
      formData = DIO.FormData.fromMap({
        "image":
            await DIO.MultipartFile.fromFile(data["image"], filename: fileName),
        "description": data["description"],
        "_method": "POST"
      });
      print("formData ${formData.fields}");
    }

    try {
      var dio = DIO.Dio();
      var response = await dio.post(
        apiurl,
        data: formData,
        options: DIO.Options(headers: {
          "Accept": 'application/json',
          'Content-Type': 'application/json',
          'x-secret': 'MonrooHeaders'
          // "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          toast(context: context, msg: "No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
            } else {
              toast(
                  context: context,
                  msg: ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });
      return response;
    } catch (error) {
      // if (error is SocketException) {
      //  toast( context: context, msg:"No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //
      //     } else {
      //      toast( context: context, msg:ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //  toast( context: context, msg:"No internet connection, try later");
    // }
  }

  deleteRequest({
    required BuildContext context,
    required String apiUrl,
  }) async {
    try {
      String appToken = '';
      print(appToken);
      print(apiUrl);
      if (appToken != null) {
        var token = appToken;
        var dio = DIO.Dio();
        final response = await dio
            .delete(
          apiUrl,
          options: DIO.Options(
              receiveTimeout: Duration(milliseconds: 30000),
              headers: {
                "Accept": 'application/json',
                'Content-Type': 'application/json',
                'x-secret': 'MonrooHeaders'
              }),
        )
            .whenComplete(() {
          debugPrint("POST Complete:");
        }).catchError((onError) {
          debugPrint("POST Error: $onError");
          if (onError is SocketException) {
            toast(context: context, msg: "No internet connection!");
          } else {
            if (onError is DIO.DioError) {
              if (ServerError.withError(error: onError).getErrorCode() == 401) {
              } else {
                toast(
                    context: context,
                    msg: ServerError.withError(error: onError)
                        .getErrorMessage()
                        .toString());
              }
            }
          }
        });
        return response;
      }

      //Connection timed out
    } on SocketException {
      toast(
        context: context,
        msg: "No Internet Connection",
      );
      print('No Internet connection 😑');
      return null;
    }
  }
}
