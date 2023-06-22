const functions = require("firebase-functions");

const admin = require("firebase-admin");
admin.initializeApp();

const firestore = admin.firestore();

exports.onUserStatusChange = functions.database.ref("/{uid}/active").onUpdate(
    async (change, context) => {
      // get data form realtime database
      const isActive = change.after.val();

      // get reference from firestore doc
      const firestoreRef = firestore.doc("users/" + context.params.uid);

      return firestoreRef.update({
        active: isActive,
        lastSeen: Date.now(),
      });
    },
);
