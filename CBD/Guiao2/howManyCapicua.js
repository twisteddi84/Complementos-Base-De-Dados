function howManyCapicua(){
    const phones = db.phones.find().toArray();
    let number_capicua = 0;
    for (let i = 0; i < phones.length; i++) {
        const phone = phones[i]["display"];
        const phone_ok = phone.replace("+351-", "");
        const phone_reverse = phone_ok.split("").reverse().join("");
        if (phone_ok === phone_reverse) {
            print(phone_ok);
            number_capicua++;
        }
    }
    print("Number of capicua phones: ",number_capicua);
}