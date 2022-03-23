import { Component, OnInit } from '@angular/core';
import { MessageService } from '../services/message.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  username: string = '';
  constructor(private messageService: MessageService) { }

  ngOnInit(): void {
    this.messageService.getMessage().subscribe(
      next => {this.username = next['text']}
    )
      
  }

}
