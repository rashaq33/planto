//
//  plant.swift
//  challege2
//
//  Created by رشا القرني on 27/04/1446 AH.
//

import SwiftUI

struct plant: View {
    //creat empty array
    let taskArray : [String] = []
    //varible for display sheet that add element to array
    @State var showAddtSheet = false
   
    var body: some View {
       
        
        
        
        
        
        
        
        
        ZStack{
            
            VStack{
               // .leading يسوي محاذات العناصر لليسار
                    VStack(alignment: .leading) {
                        Text("My Plants 🌱")
                            .font(.system(size: 34))
                            .fontWeight(.bold)
                        
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        
                        Divider()
                        
                            .background(Color.gray) // Make the divider white
                        
                        
                    }
                    
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                
                
                //دام القائمه فاضيه فطلع لي شاشه البدايه لترحيب والاضافيه
                if (taskArray.isEmpty){
                    VStack{
                        Image("plant")
                            .resizable()
                            .frame(width: 180,height: 250)
                        
                        Text("")
                        
                        Text("Start your plant jouney !")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                        Text("")
                        Text("Now all your plants will be in one place and we will help you take care of them :) 🪴")
                            .font(.system(size: 20))
                            .foregroundColor(Color.gray)
                            .frame(maxWidth: .infinity, alignment: .trailingLastTextBaseline)
                        Text("")
                        
                        Text("")
                        Text("")
                        
                        // Button to show the add sheet
                        Button("Set a plant Reminder ") {
                            
                            //  هنا فعلنا صفحه وخليناها ترو يعني اطلعي لنا بس راح تطلع شيت فلازم تحت قوس احدد وش صفحه اللي تنعرض في شيت
                            showAddtSheet = true
                        }
                        // هنا قلنا في شيت شيك اذا متغير ذا قيمته ترو فاعرض في شيت صفحه الاد طبعا علامه دولار تحط علشان اخذ قيمه متغير
                        .sheet(isPresented: $showAddtSheet){
                            
                            add()
                        }
                        
                        
                        // .sheet(isPresented: $showAddSheet){
                        // نكتب داخل الاقواس اسم صفحه اللي نبي
                        // chall2.add()
                        .frame(width: 300,height: 50)
                        .background(Color.greenn)
                        .foregroundColor(Color.black)
                        .cornerRadius(20)
                        
                    }
                    
                    //هنا خارج اقواس البوتين قلنا اعرض لي صفحه اللي ابغاها ع شكل شيت
                }
                else {
                    
                    Text("Today")
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                    
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                Spacer()
                
                
            }
            
            
            
          
           
        }
            }
        }
        
        
        
        
        
        
        
        
        
    


#Preview {
    plant()
}
